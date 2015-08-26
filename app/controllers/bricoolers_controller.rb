class BricoolersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_bricooler, only: [:show]
  # before_action :set_user, only: [:index, :show]
  after_action :verify_authorized, except: :index, unless: :devise_controller?

  def index
    @bricoolers = policy_scope(Bricooler)
  end

  def show
    authorize @bricooler
  end

private

  def set_bricooler
    @bricooler = Bricooler.find(params[:id])
  end

  # def set_user
  #   @user = Bricooler.find(params[:id]).user
  # end

  def bricooler_params
    params.require(:bricooler).permit(:first_name, :last_name, :phone, :bio, :address, :city, :zipcode, user_attributes: [ :id, :email, :password, :password_confirmation ])
  end
end
