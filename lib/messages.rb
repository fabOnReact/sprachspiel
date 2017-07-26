module Messages
	def message(missing_items)
		message = String.new
		missing_items.each do |item|
			message += "Sorry, but you need #{item[0]} of #{item[1].name} to build a #{item[2].name}"
		end
	end
end