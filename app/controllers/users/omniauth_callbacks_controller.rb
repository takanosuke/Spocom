# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    basic_action
  end

  private

  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @profile = User.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first
      if @profile
        @profile.set_values(@omniauth)
        sign_in(:user, @profile)
        flash[:notice] = "ログインしました"
        redirect_to root_path
      else
        redirect_to new_line_user_path(line: @omniauth)
      end
    else
     flash[:notice] = "ログインしました"
     redirect_to root_path
    end
  end
end
