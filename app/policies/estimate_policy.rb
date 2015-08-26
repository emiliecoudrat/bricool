class EstimatePolicy < ApplicationPolicy

  def new?
    create?
  end

  def create?
    user.profileable_type == 'Customer'
  end

end