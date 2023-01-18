class UsersController < ApplicationController
  def index
    @users=User.where(type:"Novice")
    authorize @users
  end

  def edit 
  end

  def update
    novice=Novice.find(params[:id])
    if novice.update(status: params[:status])
      redirect_to users_path, notice: "novice was successfully updated."
    else
      redirect_to campaign_path(current_user.campaigns.first), alert: "Couldn't update Novice."
    end
  end
end
