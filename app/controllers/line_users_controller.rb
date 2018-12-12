class LineUsersController < ApplicationController
  def new
    @new_user = User.new()
    @omniauth = line_params
  end
  
  def create
    @omniauth = line_params
    @new_user = User.new(user_params)
    @new_user.attributes = {provider: @omniauth[:provider], uid: @omniauth[:uid], subscription_expiration: Time.zone.now + 1.month, password: Devise.friendly_token[0, 20]}
    if @new_user.save
      @new_user.set_values(@omniauth)
      sign_in(:user, @new_user)
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :kana_last_name, :first_name, :kana_first_name, :display_name, :position, :team_id, :email, :agreement)
  end
  def line_params
    params.require(:line).permit(:provider, :uid, credentials: [:expires, :expires_at, :refresh_token, :token, :secret], info: [:description, :image, :name])
  end
end
