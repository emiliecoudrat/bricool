class EstimatePolicy < ApplicationPolicy
attr_accessor :current_user, :customer, :estimate

  def initialize(current_user, estimate)
    @current_user = current_user
    @estimate = estimate
    @customer = customer
  end

  def new?
    create?
  end

  def create?
    customer.present? && customer == estimate.customer
  end

  def estimate
    @estimate
  end

  def customer
    @customer
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end