module RoomsHelper
  def get_user_info_by_id(id)
    user = User.find_by(id:id)
    if user.present?
      {icon:image_tag(user.image, width:100), fullname:user.fullname}
    else
      {icon:nil, fullname:nil}
    end
  end

  def last_message(id)
    room_id = UserRoom.find_room_id(current_user.id, id)
    if room_id.present?
      message = Room.find(room_id).messages.last
      if message.present?
        message.content
      end
    end
  end
end
