class Product < ApplicationRecord
	extend ProductsHelper

	has_many :items, :dependent => :destroy
	has_many :objects, class_name: "Product", foreign_key: "requirement_id"
	belongs_to :building
	belongs_to :producttype
	belongs_to :price, :dependent => :destroy

	def requirement_check(input_params, room, product)
		# this method does not work well and is causing the 
		# functionality to allways require the product even if 
		# the user already has some 

		# if the product has a requirement and was set for purchase
		if product.requirement_id.present?
			requirement = Product.find(product.requirement_id)
			# check if the user has enought items
			number = input_params[product.id.to_s].to_i 
			requirement_items = room.items.where(product_id: requirement.id, used: false).limit(number)
			# if the product has a requirement and was set for purchase					
			#binding.pry
			if requirement.present? && number > 0	
			  	unless requirement_items.size < number
			  		requirement_items.each do |item|
			  			# the item is used to create a new one
			  			item.used!
			  		end
			  		#binding.pry
			  		return nil
			  	else
			  		# if the required items are not available save an error message
			  		return [number, requirement, product]
			  	end
			end					
		end
	end
end