module Account
  class ProfilesController < ApplicationController
    before_action :set_bricooler, only: [:show, :edit, :update, :destroy]
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def show
    end

    def edit
    end

    def update
      if @bricooler.update(bricooler_params)
      redirect_to bricooler_path
      else
        render :edit
      end
    end

    def destroy
      @bricooler.destroy
      redirect_to home_index
    end

  private

    def set_bricooler
      @bricooler = Bricooler.find(params[:id])
    end

    def set_user
     @user = Bricooler.find(params[:id]).user
    end

    def bricooler_params
      params.require(:bricooler).permit(:first_name, :last_name, :phone, :bio, :address, :city, :zipcode, user_attributes: [ :id, :email, :password, :password_confirmation ])
    end

  end
end