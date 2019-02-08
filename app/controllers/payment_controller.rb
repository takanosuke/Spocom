class PaymentController < ApplicationController
  before_action :authenticate_user!
  def pay
    #支払い処理
    add_purchased_list(params[:video_id])
    redirect_to root_path
  end
end