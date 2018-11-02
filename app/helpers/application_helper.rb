module ApplicationHelper
  def welcome_message
    if current_user.nil?
      "Not Login"
    elsif not current_user.name.nil?
      "Login as 【#{current_user.name}】"
    else
      "Login as 【#{current_user.email}】"
    end
  end
end
