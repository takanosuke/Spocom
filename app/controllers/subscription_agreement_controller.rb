class SubscriptionAgreementController < ApplicationController
  def expired_notification
    @old_expiration= Time.zone.now
  end
  def renewal()
    redirect_to root_path
  end
  def confirmention
    @old_expiration = Time.zone.now
    @new_expiration = Time.zone.now
  end
end
