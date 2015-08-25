class EstimatePolicy < ApplicationPolicy
attr_accessor :current_user, :estimate

  def initialize(current_user, estimate)
    @current_user = current_user
    @estimate = estimate
  end

  def new?
    create?
  end

  def create?
    current_user.profileable_type == "Customer"
  end

end