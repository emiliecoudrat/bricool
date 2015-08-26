class ServicesController < ApplicationController
  after_action :verify_authorized, except: :index, unless: :devise_controller?

  def index
    @services = policy_scope(Service)
  end

  private

  def service_params
    params.require(:service).permit(:name, :category, :price, :bricooler_id)
  end
end
