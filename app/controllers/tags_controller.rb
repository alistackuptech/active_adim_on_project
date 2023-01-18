class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: %i[ new]
  before_action :get_tag, only: %i[ edit update]

  def index
    @tags=Tag.all
    authorize @tags
  end

  def new
  end

  def edit
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to tags_path(), notice: "Tag was successfully created."
    else
      render :new, alert: "Couldn't create Tag"
    end
  end
  def update
    if @tag.update(title:params[:tag][:title])
      redirect_to tags_path(), notice: "tag was successfully updated."
    else
      render :edit, alert: "Couldn't create Tag"
    end
  end

  def destroy
    if params[:campaign_id].present?
        @tag= CampaignsTag.find_by_campaign_id(params[:campaign_id])
    else
        @tag = Tag.find(params[:id])
    end
    if @tag.destroy
      if params[:campaign_id].present?
        redirect_to campaign_path(Campaign.find(params[:campaign_id])), notice: "Tag was successfully destroyed."
      else
        redirect_to tags_path(), notice: "Tag was successfully destroyed." 
      end
    else
      redirect_to tags_path(), alert: "Tag was not destroyed."
    end
  end
  private

  def set_tag
    @tag=Tag.new
  end

  def get_tag
    @tag=Tag.find(params[:id])
  end

  def tag_params
      params.require(:tag).permit(:title)
  end
end
