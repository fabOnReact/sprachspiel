module ApplicationHelper
  def css_class(action_name)
    puts controller_name
    return "center" if controller_name == "subscriptions"
  end

  def android_request
    request.env["HTTP_USER_AGENT"].match(/turbolinks-app, sprachspiel, official, android/).present?
  end

  def alert_message(css_class)
    case css_class
      when "success" then "Well done!"
      else 
        "Oh snap!"
    end
  end	

  def msg_class
    flash.css_class
  end

  def flash_message
    flash.return_message
  end

  def url_path(method, object)
    url_for(only_path: true, action: method, id: object.id)  
  end
end
