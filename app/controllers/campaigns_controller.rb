class CampaignsController < ApplicationController
	
	before_action :set_campaign, only: %i[ show edit update destroy ]

	def index
		@campaigns = Campaign.all
	end

	def show; end

	def new
		@campaign = Campaign.new
		authorize @campaign
	end

	def edit
		@camp_tags=CampaignsTag.all.where(campaign_id:params[:id])
    @p_tag_ids=@camp_tags.pluck(:tag_id)
		authorize @campaign
	end

	def create
		@campaign = current_user.campaigns.new(campaign_params)
		@tags=params[:campaign][:tags]
		@tags.shift
		authorize @campaign
		if @campaign.save
			
			@tags.each do |tag|
        CampaignsTag.create(campaign_id:@campaign.id,tag_id:tag)
			end
			CampaignMailer.with(campaign: @campaign).new_campaign_email.deliver_later
			redirect_to campaign_url(@campaign), notice: "Campaign was successfully created."
		else
			render :new, notice: "Campaign not Created ."
		end
	end

	def update
		authorize @campaign
		@tags=params[:campaign][:tags]
		@tags.shift    
		@tags.each do |tag|
	    CampaignsTag.create(campaign_id:@campaign.id,tag_id:tag)
		end
		if @campaign.update(campaign_params)
			redirect_to campaign_url(@campaign), notice: "campaign was successfully updated."
		else
			render :edit, alert: "Couldn't UPDATE Campaign."
		end
	end

	def destroy
		authorize @campaign
		@campaign.destroy
		redirect_to campaigns_url, notice: "campaign was successfully destroyed."
	end

	private

	def set_campaign
		@campaign = Campaign.find(params[:id])
	end

	def campaign_params
		params.require(:campaign).permit(:title, :purpose, :est_duration, :tags)
  end
end
