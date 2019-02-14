class LineUsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  def new
    @new_user = User.new()
    @omniauth = line_params
  end
  
  def create
    @omniauth = line_params
    @new_user = User.new(user_params)
    @new_user.attributes = {provider: @omniauth[:provider], uid: @omniauth[:uid], password: Devise.friendly_token[0, 20]}
    if @new_user.save
      @new_user.set_values(@omniauth)
      sign_in(:user, @new_user)
      flash[:notice] = "ログインしました"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user == @user
      if @user.update(user_params)
        redirect_to root_path
      else
        render 'edit'
      end
    else
      render partial:'error/404'
    end
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :kana_last_name, :first_name, :kana_first_name, 
                                 :display_name, :team_id, :email, :image, :agreement)
  end
  def line_params
    params.require(:line).permit(:provider, :uid, 
                                 credentials: [:expires, :expires_at, :refresh_token, :token, :secret], 
                                 info: [:description, :image, :name])
  end
end
