module Account
  class ServicesController < ApplicationController
    before_action :set_bricooler
    # before_action :set_profile
    before_action :set_service, only: [:edit, :update, :destroy]
    before_action :authenticate_user!
    skip_after_action :verify_authorized
    after_action :verify_policy_scoped, only: :index
    respond_to :js

    def index
      # @services = @bricooler.services.all
      @services = policy_scope(Service)
    end

    def new
      @service = Service.new
    end

    def create
      @service = @bricooler.services.new(service_params)
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
      redirect_to account_services_path, notice: 'Le service a bien été effacé.'
    end

    private

    def set_service
      @service = Service.find(params[:id])
    end

    def set_bricooler
      @bricooler = current_user.profileable
    end

    # def set_profile
    #   @profile = current_user.profileable
    # end

    def service_params
      params.require(:service).permit(:name, :category, :price, :bricooler_id)
    end

  end
end