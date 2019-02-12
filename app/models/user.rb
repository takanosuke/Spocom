class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:line]

  has_one_attached :image
  has_many :messages
  has_many :user_rooms

  validates_acceptance_of :agreement, allow_nil: false, on: :create
  validates :team_id, presence: true
  validates :position, presence: true
  validates :first_name, length: {in: 1..15}
  validates :last_name, length: {in: 1..15}
  validates :kana_first_name, length: {in: 1..15}
  validates :kana_last_name, length: {in: 1..15}
  validates :subscription_expiration, presence: true
  validate :image_validation

  before_validation :set_initial_value, on: [:create]

  def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
    credentials = omniauth['credentials']
    info = omniauth['info']
    access_token = credentials['refresh_token']
    access_secret = credentials['secret']
    credentials = credentials.to_json
    # name = info['name']
    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  def expired?
    current_user.subscription_expiration < Time.zone.now
  end

  def teammate?(user_id)
    user = User.find_by(id:user_id)
    if user.present? && self.team_id == user.team_id
      true
    else
      false
    end
  end
  
  def coach?
    self.position == 2
  end

  def fullname
    "#{self.last_name} #{self.first_name}"
  end

  private
  def set_initial_value
    self.position ||= 1
    self.subscription_expiration ||= Time.zone.now + 1.month
    if not self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'player_1.jpg')),
                        filename: 'default.png', content_type: 'image/jpg')
    end
  end

  def image_validation
    if !image.attached?
      errors.add(:image, 'が選択されていません')
    elsif image.blob.byte_size > 15.megabytes
      image.purge
      errors.add(:image, 'ファイルが大きすぎます。')
    elsif !image?
      image.purge
      errors.add(:image, 'ファイルが無効な形式です。')
    end
  end

  def image?
    %w[image/png image/jpeg image/bmp image/gif].include?(image.blob.content_type)
  end

end
