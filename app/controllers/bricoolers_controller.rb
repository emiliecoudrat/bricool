class BricoolersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_bricooler, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  after_action :verify_authorized, except: :index, unless: :devise_controller?


  def index
    @bricoolers = policy_scope(Bricooler)
    @bricoolers = Bricooler.all
  end

  def show
    authorize @bricooler
  end

  def edit
    authorize @bricooler

  end

  def update
    if @bricooler.update(bricooler_params)
    redirect_to bricooler_path
    else
      render :edit
    end
    authorize @bricooler
  end

  def destroy
    authorize @bricooler
    @bricooler.destroy
    redirect_to home_index
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bricooler
      @bricooler = User.where(profileable_type: "Bricooler").find(params[:id]).profileable
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bricooler_params
      params.require(:bricooler).permit(:first_name, :last_name, :phone, :bio, :address, :city, :zipcode, user_attributes: [ :id, :email, :password, :password_confirmation ])
    end

    # def user_params
    #   params.require(:user).permit(:first_name, :lastname, :address, :city, :zipcode, :profileable_type, :profileable_id)
    # end
end
