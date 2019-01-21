class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:line]

  has_many :social_profiles, dependent: :destroy
  has_many :messages
  
  validates_acceptance_of :agreement, allow_nil: false, on: :create
  validates :team_id, presence: {message: "チーム名を選択してください"}
  validates :position, presence: {message: "立場を選択してください"}
  validates :first_name, length: {in: 1..15, message: "名前は1~15文字で入力してください"}
  validates :last_name, length: {in: 1..15, message: "名前は1~15文字で入力してください"}
  validates :kana_first_name, length: {in: 1..15, message: "名前は1~15文字で入力してください"}
  validates :kana_last_name, length: {in: 1..15, message: "名前は1~15文字で入力してください"}
  #validates :display_name, length: {in: 1..10, message: "表示名は1~15文字で入力してください"}
  validates :subscription_expiration, presence: true

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
    self.team_id == 2
  end
end
