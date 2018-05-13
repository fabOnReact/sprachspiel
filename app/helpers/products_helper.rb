module ProductsHelper
	def hash_keys(input)
		if input.is_a?(Hash)
	  	keys = input.keys 
	  	keys
		else 
			input
		end
	end	 

  def not_used(product)
    @count[product] > @used[product]
  end

  def not_sold(product)
    @count[product] > @sold[product]
  end
end
