class Product < ApplicationRecord
	extend ProductsHelper

	has_many :items, :dependent => :destroy
	has_many :objects, class_name: "Product", foreign_key: "requirement_id"
	belongs_to :building
	belongs_to :producttype
	belongs_to :price, :dependent => :destroy
	#belongs_to :requirement, class_name: "Product"
	def requirement_check(input_params, requirements)
		# if the product has a requirement and was set for purchase
		
		if  requirements.present && number > 0	
		  	unless requirements.size < number
		  		requirements.each do |item|
		  			# the item is used to create a new one
		  			item.used!
		  		end
		  	else
		  		# if the required items are not available save an error message
		  		# errors << " #{number} of #{requirement.name} to build #{number} #{product.name}"
		  		# missing_items << [number, requirement, self]
		  		return missing_item
		  	end
		end
	end
end
