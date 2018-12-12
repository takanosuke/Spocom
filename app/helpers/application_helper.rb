module ApplicationHelper
  def welcome_message
    if current_user.nil?
      "Not Login"
    else
      "Login as 【#{current_user.display_name}】"
    end
  end
end
