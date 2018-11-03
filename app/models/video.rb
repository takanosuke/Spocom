class Video < ApplicationRecord
  has_one_attached :video

  def register(params, user)
    self.price = 100
    self.title = make_video_title(params[:team1_id], params[:team2_id])
    self.sport = "soccer"
    self.contributor_id = user
    self.team1_id = params[:team1_id]
    self.team2_id = params[:team2_id]
    self.video.attach(params[:video])
    self.save
  end

  private
  def make_video_title(team1_id,team2_id)
     team1_name = Team.find(team1_id).name
     team2_name = Team.find(team2_id).name
     "#{team1_name} VS #{team2_name}"
  end
end
