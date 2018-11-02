class PaymentController < ApplicationController
  def pay
    #支払い処理
    add_purchased_list()
    redirect_to root_path
  end
  def confirmention
  end
  private
  def add_purchased_list()
    current_user.purchased_videos.create()
  end
end