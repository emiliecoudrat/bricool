class CustomersController < ApplicationController
  # before_filter :ensure_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?



  def show
      @customer = current_user
      authorize @customer
    # if current_user.first_name.nil? || current_user.last_name.nil?
    #   redirect_to edit_customer_path
    #   flash[:alert] = "N'oubliez pas de complétez votre profil !"
    # end
  end

  def edit
    authorize @customer
  end

  def update
    if @customer.update(customer_params)
    redirect_to home_index
    else
      render :edit
    end
    authorize @customer
  end

  def destroy
    @customer.destroy
    redirect_to home_index
    authorize @customer
  end

private

  def set_customer
    @customer = current_user.profileable
    authorize @customer
  end


  def set_user
      @user = current_user
  end

  def customer_params
      params.require(:customer).permit(:first_name, :last_name, :address, :city, :zipcode, :profileable_type, :profileable_id)
  end
end
