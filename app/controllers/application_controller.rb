class ApplicationController < ActionController::Base
  def check_subscription_expiration
    if current_user.expired?
      redirect_to expired_notification_path
    end
  end
end
