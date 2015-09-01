class RatingsController < ApplicationController
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  before_action :set_customer, only: [:new, :create]
  before_action :set_bricooler, only: [:index, :show]
  # before_action :set_rating


  def index
    @ratings = @bricooler.ratings.all
  end

  def show
    @bricooler
  end

  def new
    @rating = @customer.ratings.new
  end

  def create
    @rating = @customer.ratings.new(rating_params)
  end

  def destroy
  end

  private
  # def set_rating
  #   @rating = Rating.find(params[:id])
  # end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def set_bricooler
    @bricooler = Bricooler.find(params[:bricooler_id])
  end

  def rating_params
    params.require(:rating).permit(:average_mark, :comment, :bricooler_id, :customer_id)
  end
end
