class VideosController < ApplicationController
  def top_page
    @video = Video.all.order(:created_at).first
  end
  def index
    @videos = Video.all.order(:created_at)
  end
  def show
    @video = Video.find(params[:id])
  end
  def new
    @video = Video.new
  end
  def create
    video = Video.new
    video.register(video_params, current_user.id)
    redirect_to videos_path
  end
  private
    def video_params
      params.require(:video).permit(:video, :team1_id, :team2_id)
    end
end
