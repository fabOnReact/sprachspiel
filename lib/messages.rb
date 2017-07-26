module Messages
	def message(missing_items)
		message = String.new
		missing_items.each do |item|
			message += "Tut mir leid, aber Sie brauchen #{item[0]} #{item[1].name} um eine #{item[2].name} zu bauen"
			#binding.pry
		end
		return message
	end
end