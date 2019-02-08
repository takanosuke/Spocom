class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def check_subscription_expiration
    if User.expired?
      redirect_to expired_notification_path
    end
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :kana_last_name, :first_name, :kana_first_name, :display_name, :team_id, :agreement])
  end

end
