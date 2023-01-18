class TodoPolicy < ApplicationPolicy
  def new?
    Campaign.find_by_id(record.campaign_id).expert_id==user.id
  end

  def create?
    Campaign.find_by_id(record.campaign_id).expert_id==user.id
  end

  def edit?
    Campaign.find_by_id(record.campaign_id).expert_id==user.id
  end

  def update?
    Campaign.find_by_id(record.campaign_id).expert_id==user.id
  end

  def destroy?
    Campaign.find_by_id(record.campaign_id).expert_id==user.id
  end
end
