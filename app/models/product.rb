class Product < ApplicationRecord
	PRODUCTS = {'sichel' => "sickle.svg",'schwert' => "sword.svg",'achse' => "axe.svg",'bank' => "desk.svg","hammer" => "hammer2.svg",'brot' => 'bread.svg','messer' => "butcher.svg",'ofen' => "stone-oven.svg",'hähnchen' => "meat.svg",'schild' => "shield.svg", 'fisch' => 'fish.svg', 'steak' => 'steak.svg'}
	BW = ['bank', 'ofen', 'achse']
	has_many :items, :dependent => :destroy
	# has_many :purchases, :dependent => :destroy
	has_many :objects, class_name: "Product", foreign_key: "requirement_id"
	# has_one :description
	# belongs_to :building
	# belongs_to :category
	# replaces with the price field
	# belongs_to :price, :dependent => :destroy
	scope :not_used_items, -> { find_by_sql("SELECT products.name, products.price_id, COUNT(items.id) AS NumberOfItems FROM products INNER JOIN items on products.id = items.product_id GROUP BY products.id;") }

	def picture
		PRODUCTS[self.name]
	end

  def color
    "color" # unless BW.include? self.name
  end  

	def requirement_check(input_params, room, product)
		# this method does not work well and is causing the 
		# functionality to allways require the product even if 
		# the user already has some 

		# if the product has a requirement and was set for purchase
		# binding.pry
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