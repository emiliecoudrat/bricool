module Account
  class ServicesController < ApplicationController
    before_action :set_bricooler, only: [:show, :new, :create, :edit, :update, :destroy]
    before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
      @services = current_user.services
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
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