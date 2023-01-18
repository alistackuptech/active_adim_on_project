class CampaignMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_campaign_email
    @campaign = params[:campaign]
    @url  = 'http://localhost:3000/'
    mail(to: User.find(Campaign.first.expert_id).email, subject: 'Welcome to My Awesome Site')
  end
end
