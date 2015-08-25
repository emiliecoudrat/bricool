class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!


  after_action :verify_authorized, except: :index, unless: :devise_or_admin_controller?
  # after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path)
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

  def devise_or_admin_controller?
    devise_controller? || params[:controller] =~ /^admin/
  end

end
