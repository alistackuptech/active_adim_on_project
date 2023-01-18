module CampaignsHelper
  def isEmptyTopic()
    if @campaign.discussion_topics.where("novice_id = ?", current_user.id).empty?
      return true
    else  
      return false
    end
  end

  def canHaveTopic()   
    campaign = Campaign.where(expert_id: @campaign.expert_id)
    campaign.can_have_topic(current_user.id)>0 ? (return false) : (return true)
  end

  def saveStatusChange(n_id)
    if @campaign.discussion_topics.where("novice_id = ?", current_user.id).empty?
      return true
    else    
      return false
    end
  end


  # campaign = Campaign.where(expert_id: @campaign.expert_id)
  # campaign.can_have_discussion
  # campaign.joins(:discussion_topics).where(discussion_topics: {novice_id: current_user.id}).count
  

  # expert = Expert.find(@campaign.expert_id)
  # Campaign.where(expert_id:(expert.id)).each do |camp|
  #   camp.discussion_topics.each do |disc|
  #     if disc.novice_id == current_user.id
  #       return false
  #     end
  #   end
  # end
  # return true

end
