class BricoolersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_action :set_bricooler, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
  # before_action :find_profileable

  def index
    @bricoolers = Bricooler.all
  end

  def show
  end

  def edit
  end

  def update
    @bricooler.update(bricooler_params)
    redirect_to home_index
  end

  def destroy
    @bricooler.destroy
    redirect_to home_index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bricooler
      @bricooler = current_user.profileable
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bricooler_params
      params.require(:bricooler).permit(:first_name, :last_name, :address, :city, :zipcode, :profileable_type, :profileable_id)
    end

    # def user_params
    #   params.require(:user).permit(:first_name, :lastname, :address, :city, :zipcode, :profileable_type, :profileable_id)
    # end
end
