module ApplicationHelper
  def form_error_messages(model)
    return "" if model.errors.empty?
    html = "<div id='error_explanation' class='alert alert-danger'><ul>"
    messages = model.errors.full_messages.each do |message|
      html += "<li>#{message}</li>"
    end        
    html += "</ul></div>"
    html.html_safe
  end
end