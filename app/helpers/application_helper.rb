module ApplicationHelper
	# def header(type, text)
	# 	case type
	# 		when "rooms"
	# 			content_for(:rooms) { text } 
	# 	end
	# end	

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
	# def room 
	# 	current_user.rooms.first
	# end

	# def room_id
	# 	room.id
	# end

	# def chatroom_id
	# 	room.chatroom.id
	# end
end
