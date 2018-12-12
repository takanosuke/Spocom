class ApplicationController < ActionController::Base
  def check_subscription_expiration
    if User.expired?
      redirect_to expired_notification_path
    end
  end
end
