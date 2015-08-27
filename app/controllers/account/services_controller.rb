module Account
  class ServicesController < ApplicationController
    before_action :set_bricooler, only: [:show, :new, :create, :edit, :update, :destroy]
    before_action :set_service, only: [:edit, :update, :destroy]
    skip_after_action :verify_authorized

    def index
      @services = current_user.services
    end

    def new
      @service = Service.new
    end

    def create
      @service = current_user.profileable.services.new(service_params)
      if @service.save
        redirect_to root_path, notice: 'Le service a bien été crée.'
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

    def set_bricooler
      @bricooler = current_user.profileable
    end

    def service_params
      params.require(:service).permit(:name, :category, :price)
    end

  end
end