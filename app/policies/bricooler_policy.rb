class BricoolerPolicy < ApplicationPolicy
  attr_accessor :current_user, :Bricooler

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def initialize(current_user, customer)
    @current_user = current_user
    @bricooler = bricooler
  end

  def show?
    if current_user.profileable_type == 'Bricooler'
      true
    elsif user.profile_type == 'Customer'
      @record.customer == user.profileable
    elsif
      @record == user.profile
    end
  end

  def update?
    if current_user.profileable_type == "Bricooler"
      true
    end
  end

  def destroy?
    if current_user.profileable_type == "Bricooler"
      true
    end
  end

end
