class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:top_page]

  def top_page
    @video = Video.all.order(:created_at).first
  end
  def index
    team_id = current_user.team_id
    @my_team = Team.find(team_id).name
    @videos = Video.where('team1_id=? or team2_id=?', team_id, team_id).all.order(:created_at)
  end
  def show
    @video = Video.find(params[:id])
  end
  def new
    @video = Video.new
  end
  def create
    @video = Video.new
    if @video.register(video_params, current_user.id)
      redirect_to videos_path
    else
      render 'new'
    end
  end
  private
    def video_params
      params.require(:video).permit(:video, :team1_id, :team2_id, :date)
    end
end
