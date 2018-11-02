class VideosController < ApplicationController
  def topPage
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
    @new_video = Video.create(video_params)
    redirect_to videos_path
  end
  def 
  def update
  end
  def destroy
  end
  def boughtList
  end
  private
    def video_params
      params.require(:video).permit(:video)
    end
end
