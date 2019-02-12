class UserRoom < ApplicationRecord

  def self.find_room_id(id, id2)
    user_room = where("user_id = ?", id).pluck(:room_id)
    to_user_room = where("user_id = ?", id2).pluck(:room_id)
    room_id = (user_room & to_user_room).min
  end
end
