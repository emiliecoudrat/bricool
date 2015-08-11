class CustomersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_customer, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    @customer.update(customer_params)
    redirect_to home_index
  end

  def destroy
    @customer.destroy
    redirect_to home_index
  end

  def set_customer
     @customer = current_user.profileable
  end

  def set_user
      @user = current_user
  end

  def customer_params
      params.require(:customer).permit(:first_name, :last_name, :address, :city, :zipcode, :profileable_type, :profileable_id)
  end
end
