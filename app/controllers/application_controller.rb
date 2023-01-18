class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end

  def after_sign_in_path_for(resource)
    case resource
      when AdminUser then admin_dashboard_path
    else 
      campaigns_path
    end
  end
  
  def after_sign_out_path_for(resource)
    case resource
      when AdminUser then admin_dashboard_path
    else 
      users_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :status, :type, :profession, :service)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password, :profession, :service)}
  end

end
