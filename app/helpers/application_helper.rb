module ApplicationHelper
	def header(type, text)
		case type
			when "rooms"
				content_for(:rooms) { text } 
		end
	end	
end
