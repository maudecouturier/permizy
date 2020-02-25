class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(student: user).or(scope.where(teacher: user))
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
