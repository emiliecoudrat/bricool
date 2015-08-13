class EstimatePolicy < ApplicationPolicy
attr_accessor :customer

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(customer, estimate)
    @customer = customer
    @estimate = estimate
  end

  def new?
    create?
  end

  def create?
    customer.present?
  end

  def estimate
    @estimate
  end

end