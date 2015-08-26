class ServicesController < ApplicationController

  def index
    @services = policy_scope(Service)
  end

  private

  def service_params
    params.require(:service).permit(:name, :category, :price, :bricooler_id)
  end

end
