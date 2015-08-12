class CustomersController < ApplicationController
  before_filter :authenticate_user!
  # before_filter :ensure_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :verify_authorized, except: [:new, :create, :index]


  def show
    @customer.show(customer_params)
    authorize @customer
  end

  def edit
    authorize @customer
  end

  def update
    authorize @customer
    if @customer.update(customer_params)
    redirect_to home_index
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    authorize @customer
    redirect_to home_index
  end

private

  def set_customer
    @customer = current_user.profileable
  end


  def set_user
      @user = current_user
  end

  # def ensure_customer
  #   redirect_to(home_index_path) unless @customer.nil?
  #   raise
  # end

  def customer_params
      params.require(:customer).permit(:first_name, :last_name, :address, :city, :zipcode, :profileable_type, :profileable_id)
  end
end
