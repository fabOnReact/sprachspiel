module ActionDispatch
	class Flash
		class FlashHash
			def first_key
				self.keys().first
			end

			def return_message
				case first_key
					when "notice" then self[:notice]
					when "error" then self[:error]
					when "alert" then self[:alert]
					when "warning" then self[:warning]
				end													
			end

			def css_class
				case first_key
					when "notice" then 'success'
					when "warning" then 'warning'
					else
						'danger'
				end			
			end
		end
	end
end