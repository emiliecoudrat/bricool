class ServicesController < ApplicationController
  before_action :set_bricooler, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
  end

  def edit
  end

  def update
    @service.update(service_params)
    redirect_to root_path
  end

  def destroy
    @service.destroy
    redirect_to root_path
  end


  private

  def set_bricooler
    @bricooler = current_user.profileable(params[:bricooler_id])
  end

  def service_params
    params.require(:service).permit(:name, :category, :price, :bricooler_id)
  end

end
