class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    build_resource(sign_up_params)

    case resource.profileable_type
    when'Bricooler'
      resource.profileable = Bricooler.new
    when 'Customer'
      resource.profileable = Customer.new
    end
    resource_saved = resource.save

    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update
    super
  end


  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def after_sign_up_path_for(resource)
    case current_user.profileable_type
    when "Bricooler"
      return edit_bricooler_path(resource.id)
    when "Customer"
      return edit_customer_path(resource.id)
    end
  end

  def after_update_path_for(resource)
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :profileable_type )
  end

end