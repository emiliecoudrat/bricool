class ServicesController < ApplicationController
  before_action :set_service, except: :index
  skip_before_action :authenticate_user!
  after_action :verify_policy_scoped, only: :index

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
