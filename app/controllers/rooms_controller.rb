class RoomsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.coach?
      @team_users = User.where("team_id = ?", current_user.team_id)
                        .where.not(id: current_user.id).all()
      @list_name = "選手一覧"
    else
      @team_users = User.where("team_id = ?", current_user.team_id)
                        .where("position = ?", 2).all()
      @list_name = "監督一覧"
    end
  end

  def find
    if current_user.teammate?(params[:id])
      room_id = UserRoom.find_room_id(current_user.id, params[:id])
      if room_id.blank?
        create_room(params[:id])
      else
        redirect_to room_path(room_id)
      end
    else
      render partial:"/error/404"
    end
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    to_user = @room.user_rooms.where("user_id!=?", current_user.id).first.user_id
    to_user = User.find_by(id: to_user)
    if to_user.nil?
      @to_user_name = "UNKNOWN"
    else
      @to_user_name = to_user.fullname
    end
  end

  private
  def create_room(to_user_id)
    new_room = Room.create()
    user_room = UserRoom.create(room_id: new_room.id, user_id: current_user.id)
    to_user_room = UserRoom.create(room_id: new_room.id, user_id: to_user_id)
    redirect_to room_path(new_room.id)
  end
end