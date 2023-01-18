class CampaignPolicy < ApplicationPolicy
  def index?
    user.type == 'Novice' || user.type == 'Expert'    
  end

  def new?
    user.type == 'Expert'
  end

  def create?
    user.type == 'Expert'
  end

  def edit?
    user.type == 'Expert' && user.id==record.expert_id
  end

  def update?
    user.type == 'Expert' && user.id==record.expert_id
  end

  def destroy?
    user.type == 'Expert' && user.id==record.expert_id
  end
end