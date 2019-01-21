class Video < ApplicationRecord
  has_one_attached :video

  validates :team1_id, presence: {message: "自分のチーム名を選択してください"}
  validates :team2_id, presence: {message: "対戦相手のチーム名を選択してください"}
  validate :video_validation

  def register(params, user)
    self.attributes = params
    self.title = make_video_title(params[:team1_id], params[:team2_id])
    self.sport = "soccer"
    self.contributor_id = user
    self.video.attach(params[:video])
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
      errors.add(:video, I18n.t('動画が選択されていません。'))
    elsif video.blob.byte_size > 10.gigabytes
      video.purge
      errors.add(:video, I18n.t('動画ファイルが大きすぎます。'))
    elsif !video?
      video.purge
      errors.add(:video, I18n.t('そのファイル形式には対応していません。'))
    end
  end

  def video?
    %w[video/mp4 video/gif].include?(video.blob.content_type)
  end
end
