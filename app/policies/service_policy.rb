# class ServicePolicy < ApplicationPolicy
#   attr_accessor :current_user, :service

#   class Scope < Scope
#     def resolve
#       scope
#     end
#   end

#   def initialize(current_user, service)
#     @current_user = current_user
#     @service = service
#   end

#   def new?
#     current_user.admin
#   end

#   def create?
#     true
#   end

#   def show?
#     true
#   end

#   def update?
#     true
#   end

#   def destroy?
#    true
#   end

# end
