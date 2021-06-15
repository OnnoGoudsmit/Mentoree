class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def my_dashboard?
    true if user
  end

  def create
    true if current_user
  end
end
