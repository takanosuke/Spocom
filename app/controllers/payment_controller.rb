class PaymentController < ApplicationController
  def pay
    #支払い処理
    add_purchased_list(params[:video_id])
    redirect_to root_path
  end
  def confirmention
    @video = Video.find(params[:video_id])
  end
  private
  def add_purchased_list(video_id)
    video = Video.find(video_id)
    current_user.purchased_videos.create({video_id: video.id, video_title: video.title, price: video.price})
  end
end