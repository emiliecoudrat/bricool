class ServicesController < ApplicationController
  before_action :set_service, only: :index
  after_action :verify_authorized, except: :index, unless: :devise_controller?
  skip_before_action :authenticate_user!

  def index
    @services = policy_scope(Service)
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :category, :price, :bricooler_id)
  end
end
