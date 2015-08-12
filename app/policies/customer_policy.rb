class CustomerPolicy < ApplicationPolicy
  attr_accessor :current_user, :customer

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(current_user, customer)
    @current_user = current_user
    @customer = customer
  end

  def show?
    if current_user.profileable_type == "Customer"
      true
    end
  end

  def update?
    if current_user.profileable_type == "Customer"
      true
    end
  end

  def destroy?
    if current_user.profileable_type == "Customer"
      true
    end
  end

end
