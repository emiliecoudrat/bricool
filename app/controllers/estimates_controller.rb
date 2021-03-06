class EstimatesController < ApplicationController
  before_action :set_customer
  after_action :verify_authorized, except: :index, unless: :devise_controller?

  def new
    @estimate = @customer.estimates.new
    authorize @estimate
  end

  def create
    @estimate = @customer.estimates.new(estimate_params)
    @estimate.customer_id = current_user.profileable.id
    if @estimate.save
      flash[:notice] = "Merci pour votre demande! Nous reviendrons vers vous dans moins de 24h."
      redirect_to home_index_path
    else
      flash[:notice] = "Désolée, merci de reformuler votre demande."
      render :new
    end
    authorize @estimate
  end

  def show
    authorize @estimate
  end

  private

  def set_customer
    @customer = current_user.profileable(params[:customer_id])
  end

  def estimate_params
    params.require(:estimate).permit(:customer_id, :title, :description, :picture, customer_attributes: [ :id ])
  end
end
