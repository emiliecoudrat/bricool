class EstimatePolicy < ApplicationPolicy
attr_accessor :current_user, :customer, :estimate

  def initialize(current_user, estimate)
    @current_user = current_user
    @estimate = estimate
  end

  def new?
    create?
  end

  def create?
    true
    # if current_user.profileable_type == 'Customer'
    #   true
    # end
  end

  def current_user
    @current_user
  end

  def estimate
    @estimate
  end

  # class Scope < Scope
  #   def resolve
  #     scope.all
  #   end
  # end
end