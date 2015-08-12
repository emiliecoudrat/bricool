class CustomerPolicy < ApplicationPolicy
  attr_accessor :current_user, :customer

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(current_user, customer)
    @current_user= current_user
    @customer = customer
  end

  def show?
    @customer == current_user.profileable
  end

  def update?
    @customer == current_user.profileable
  end

  def destroy?
    @customer == current_user.profileable
  end

end
