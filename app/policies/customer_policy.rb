class CustomerPolicy < ApplicationPolicy

  def show?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end
