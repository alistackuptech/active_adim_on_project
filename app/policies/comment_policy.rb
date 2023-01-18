class CommentPolicy < ApplicationPolicy
  def new?
    user.type == 'Novice' || user.type == 'Expert'   
  end

  def create?
    user.type == 'Novice' || user.type == 'Expert'   
  end

  def edit?
    user.id==record.user_id  
  end

  def update?
    user.id==record.user_id  
  end

  def destroy?
    user.id==record.user_id
  end
end
