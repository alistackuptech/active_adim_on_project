class DiscussionTopicsController < ApplicationController  
	before_action :set_discussion_topic, only: %i[ edit update destroy ]
	before_action :get_campaign, only: %i[ index new edit update create destroy ]
	
	def index
		@discussion_topics=@campaign.discussion_topics
	end
	
	def new
		@discussion_topic = @campaign.discussion_topics.new
		authorize @discussion_topic
	end
	
	def edit
		authorize @discussion_topic
	end

	def create
		@discussion_topic=@campaign.discussion_topics.new(discussion_topic_params)
		@discussion_topic.novice_id=current_user.id
		authorize @discussion_topic
		if @discussion_topic.save
			redirect_to campaign_discussion_topics_path(@campaign), notice: "discussion_topic was successfully created."
		else
			render :new, alert: "Couldn't create Topic"
		end
	end

	def update
		authorize @discussion_topic
		if @discussion_topic.update(discussion_topic_params)
			redirect_to campaign_discussion_topics_path(@campaign), notice: "discussion_topic was successfully updated."
		else
			render :edit, alert: "Couldn't update Topic"
		end
	end

	# DELETE /discussion_topics/1 or /discussion_topics/1.json
	def destroy
		authorize @discussion_topic
		@discussion_topic.destroy
		redirect_to campaign_discussion_topics_path(@campaign), notice: "discussion_topic was successfully destroyed."
	end

	private

	def get_campaign
		@campaign = Campaign.find(params[:campaign_id])
	end
	
	def set_discussion_topic        
		@discussion_topic = DiscussionTopic.find(params[:id]) 
	end


	def discussion_topic_params
		params.require(:discussion_topic).permit(:title)
	end
end