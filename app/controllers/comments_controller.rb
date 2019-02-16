class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    video = Video.find(params[:video_id])
    @comment = video.comments.new(comment_params)
    @comment.user_id = current_user.id;
    @comment.save
    redirect_to video_path(video)
  end
  private
    def comment_params
      params.require(:comment).permit(:body, :time)
    end
end
