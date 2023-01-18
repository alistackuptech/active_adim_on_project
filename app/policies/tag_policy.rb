class TagPolicy < ApplicationPolicy
  def new?
    user.type == 'Expert'    
  end
  def index?
    user.type== "Expert"
  end

  def create?
    user.type == 'Expert'    
  end

  def edit?
    user.type == 'Expert'    
  end

  def update?
    user.type == 'Expert'    
  end

  def destroy?
    user.type == 'Expert'  
    end
end
