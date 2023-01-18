class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ edit update destroy ]
  def index
    if topic_present
      set_discussion_topic
      @comments=@discussion_topic.comments
    else
      set_campaign
      @comments=@campaign.comments
    end
  end

  def new
    if topic_present
      set_discussion_topic
      @campaign=@discussion_topic.campaign
    else
      set_campaign
    end
    @commentable = find_commentable
    @comment = Comment.new
    authorize @comment
  end

  def edit
    @commentable = find_commentable

    # set_comment
    authorize @comment
    if topic_present
      set_discussion_topic
      # @campaign=Campaign.find(DiscussionTopic.find(params[:discussion_topic_id]).campaign_id)
      @campaign=@discussion_topic.campaign
    else
      set_campaign
    end
  end

  def update
    # set_comment
    authorize @comment
		if @comment.update(comment_params)
			flash[:notice] = "Successfully updated comment."
      topic_present ? (redirect_to discussion_topic_comments_path(set_discussion_topic)) : (redirect_to campaign_path(set_campaign))
		else
      flash[:alert] = "Couldn't update comment."
      topic_present ? (redirect_to discussion_topic_comments_path(set_discussion_topic)) : (redirect_to campaign_path(set_campaign))
		end
  end
  
  def create
    if topic_present
      set_discussion_topic
      @campaign=@discussion_topic.campaign
    else
      set_campaign
    end
    @commentable = find_commentable
    @comment = @commentable.comments.new(comment_params)
    # @comment.title=params[:comment][:title]
    authorize @comment
    @comment.user_id=current_user.id
    if @comment.save
      flash[:notice] = "Successfully created comment."
      # (params[:discussion_topic_id]).present? ? (redirect_to discussion_topic_comments_path(@discussion_topic)) : (redirect_to campaign_path(@campaign))  
      topic_present ? (redirect_to discussion_topic_comments_path(@discussion_topic)) : (redirect_to campaign_path(@campaign))  
    else
      flash[:alert] = "Could not creat comment."
      # topic_present ? (redirect_to campaign_discusssion_topics_path(@campaign, @discussion_topic)) : (redirect_to campaign_path(@campaign))  
    end
  end

  def destroy
    # set_comment
    authorize @comment
    @comment.destroy
    # (params[:discussion_topic_id]).present? ? (redirect_to campaign_discussion_topic_comments_path(Campaign.find(params[:campaign_id]), (DiscussionTopic.find(params[:discussion_topic_id]))) : (redirect to Campaign.find(params[:campaign_id]))  
    if topic_present
      set_discussion_topic
      redirect_to discussion_topic_comments_path(@discussion_topic), notice: "comment was successfully destroyed."
    elsif (params[:campaign_id])
      redirect_to campaign_url(Campaign.find(params[:campaign_id])), notice: "comment was successfully destroyed." 
    end
  end
  private
  
  def topic_present
    if params[:discussion_topic_id].present?
      return true
    else
      return false
    end
  end

  def set_discussion_topic        
    @discussion_topic=DiscussionTopic.find(params[:discussion_topic_id])
	end

  def set_campaign
    @campaign=Campaign.find(params[:campaign_id])
  end

  def set_comment
    @comment=Comment.find(params[:id])
  end

  def find_commentable
    # params.each do |name, value|
    #   if name =~ /(.+)_id$/
    #     return $1.classify.constantize.find(value)
    #   end
    # end
    if topic_present
      @commentable=set_discussion_topic
    else
      @commentable=set_campaign
    end    
  end
  
  def comment_params
		params.require(:comment).permit(:title)
	end
end