class EstimatesController < ApplicationController
  before_action :set_user
  before_action :set_customer, only: [:new, :create, :show]
  # after_action :verify_authorized, except: :index, unless: :devise_controller?

  def new
    @estimate = Estimate.new
    authorize @estimate
  end

  def create
    @estimate = Estimate.new(estimate_params)
    if @estimate.save
      flash[:notice] = "Merci pour votre demande!"
      redirect_to home_index
    else
      render :new
    end

    authorize @estimate

  end

  def show
    authorize @estimate
  end

  private

  def set_customer
    @customer = current_user.profileable
  end

  def set_user
    @user = current_user
  end

  def estimate_params
    params.require(:estimate).permit(:customer_id, :title, :description, :picture)
  end
end
