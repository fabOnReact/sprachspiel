module ProductsHelper
  BW = ['bank', 'ofen', 'ache']
	def hash_keys(input)
		if input.is_a?(Hash)
	  	keys = input.keys 
	  	keys
		else 
			input
		end
	end	

  def color
    "color" unless Product::BW.include? self.name
  end   
end
