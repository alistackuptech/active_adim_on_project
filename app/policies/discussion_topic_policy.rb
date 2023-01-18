class DiscussionTopicPolicy < ApplicationPolicy
  
  def new?
    user.type == 'Novice'
  end

  def create?
    user.type == 'Novice'
  end

  def edit?
    user.type == 'Novice' && user.id==record.novice_id
  end

  def update?
    user.type == 'Novice' && user.id==record.novice_id
  end

  def destroy?
    user.type == 'Novice' && user.id==record.novice_id
  end
end
