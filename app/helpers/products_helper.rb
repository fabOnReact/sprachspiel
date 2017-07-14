module ProductsHelper
	def hash_keys(input)
		if input.is_a?(Hash)
	  	keys = input.keys 
	  	keys
		else 
			input
		end
	end	
end
