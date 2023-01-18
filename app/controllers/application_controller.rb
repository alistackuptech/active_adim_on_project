class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_in_path_for(resource)
    campaigns_path
  end
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :status, :type, :profession, :service)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :profession, :service)}
    end
end
