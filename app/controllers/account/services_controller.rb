module Account
  class ServicesController < ApplicationController
    # before_action :set_bricooler, only: [:show, :new, :create, :edit, :update, :destroy]
    # before_action :set_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    before_action :set_service, only [:show, :edit, :update, :destroy]
    before_action :authenticate_user!

    def index
      @services = current_user.services
    end

    def new
      @service = Service.new
    end

    def create
      @service = current_user.services.new(service_params)

      if @service.save
        redirect_to @service, notice: 'Le service a bien été crée.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @service.update(service_params)
        redirect_to @service, notice: 'Le service a été bien été modifié.'
      else
        render :edit
      end
    end

    def destroy
      @service.destroy
      redirect_to services_url, notice: 'Le service a bien été effacé.'
    end

    private

    def set_service
      @service = Service.find(params[:id])
    end

    # def set_bricooler
    #   @bricooler = Bricooler.find(params[:id])
    # end

    # def set_user
    #   @user = Bricooler.find(params[:id]).user
    # end

    # def bricooler_params
    #   params.require(:bricooler).permit(:first_name, :last_name, :phone, :bio, :address, :city, :zipcode, user_attributes: [ :id, :email, :password, :password_confirmation ])
    # end

    def service_params
      params.require(:service).permit(:name, :category, :price, :bricooler_id)
    end

  end
end