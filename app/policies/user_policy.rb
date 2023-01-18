class UserPolicy < ApplicationPolicy
  def index?
    user.type == 'Expert'
  end
end
