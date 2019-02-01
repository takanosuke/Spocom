module RoomsHelper
  def display_name(id)
    user = User.find_by(id:id)
    if user.nil?
      "UNKNOWN"
    else 
      user.display_name
    end
  end
end
