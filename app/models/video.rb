class Video < ApplicationRecord
  has_one_attached :video
  has_many :comments, dependent: :destroy

  validates :team1_id, presence: true
  validates :team2_id, presence: true
  validate :video_validation

  def register(params, user)
    self.attributes = params
    self.title = make_video_title(params[:team1_id], params[:team2_id])
    self.sport = "soccer"
    self.contributor_id = user
    self.save
  end

  private
  def make_video_title(team1_id,team2_id)
    team1 = Team.find_by(id:team1_id)
    team2 = Team.find_by(id:team2_id)
    if team1.nil? || team2.nil?
      "Notitle"
    else
      team1_name = Team.find_by(id:team1_id).name
      team2_name = Team.find_by(id:team2_id).name
      "#{team1_name} VS #{team2_name}"
    end
  end
  
  def video_validation
    if !video.attached?
      errors.add(:video, 'が選択されていません')
    elsif video.blob.byte_size > 10.gigabytes
      video.purge
      errors.add(:video, 'ファイルが大きすぎます。')
    elsif !video?
      video.purge
      errors.add(:video, 'ファイルが無効な形式です。')
    end
  end

  def video?
    %w[video/mp4 video/gif video/mov video/m4v video/quicktime].include?(video.blob.content_type)
  end
end
