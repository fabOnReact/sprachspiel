module ApplicationHelper
	def header(type, text)
		case type
			when "rooms"
				content_for(:rooms) { text } 
		end
	end	

	def css_class(action_name)
		return "center" if action_name == "welcome"
	end
end
