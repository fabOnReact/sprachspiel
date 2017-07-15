class Purchase < ApplicationRecord
	has_many :items
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :sale
	
	accepts_nested_attributes_for :items

	def self.creating(room, price, user, selfmade)
		purchase = Purchase.create(room_id: room.id, price_id: price.id, user_id: user.id, selfmade: selfmade)
		return purchase
	end

	def self.new_instance(room, price, user, selfmade)
		@purchase = Purchase.new(room_id: room.id, price_id: price.id, user_id: user.id, selfmade: selfmade)
	end

	def self.create_purchase(params, room, price, user)
		binding.pry	
		@purchase = Purchase.new_instance(room, price, user, true)
		if user.room_owner(room)
		  products = room.building.products
		  product_ids = room.building.products.order(id: :asc).pluck(:id)
		  errors = []
		  # Collect the products id requirements
		  products.each do |product|
		  	requirement = Product.find(product.requirement_id)
		  	number = params[product.id.to_s]
		  	requirement_items = room.items.where(id: requirement.id).limit(number)
		  	unless requirement_items.size < number
		  		requirement_items.each do |item|
		  			item.used = true
		  			item.save
		  		end
		  	else
		  		errors << " #{number} of #{requirement.name} to build #{number} #{product.name}"
		  	end

		  	if errors.present? 
		  		# 1 IMPORTANT READ
		  		# figure out a correct way to do this in the controller (for the flash messages) and 
		  		# also how to loop this message so that is DRY
		  		# https://glenngillen.com/thoughts/useful-flash-messages-in-rails
		  		string = "Sorry, but you need"
		  		errors.each do |error|

		  		end
		  	end
		  end
		  # Validate all that the user has the requirements

		  # the item used needs to be flagged as used and deleted

		  @purchase.fill_with_items(params, product_ids, room.id, user)
		else 
		  user.clear_purchases(room.id)
		  items = room.items.where(sold: false, used: false).order(:product_id)
    	  @items_number = items.group(:product_id).count   
		  @purchase.fill_with_items(params, @items_number, room.id, user)
		  @purchase.selfmade = nil
		end     
		@purchase.save       
	end 

	def items_change_room
		self.items.each do |item|
			room_id = self.user.rooms.first.id
		    item.update_attributes(room_id: room_id)
		end
	end

	def selfmade_items(boolean)
		self.items.each do |item|
			item.update_attributes(selfmade: boolean)
		end		
	end

	def fill_with_items(parameters, object, room_id, user)
		object = Product.hash_keys(object)
		parameters.each do |index, nitems|      	
			index = index.to_i
			n = nitems.to_i
			product_id = object[index]
			if user.room_owner(Room.find(room_id))
				self.items << self.create_items(product_id, room_id, n)
			else 
				# change the selfmade to nil
				# you need to select the correct items
				self.items << Item.where_limit(product_id, room_id, n)			
				self.selfmade_items(nil)
			end
		end 	
    end

	def create_items(product_id, room_id, n)
		items = []
		n.times do 
			items << Item.create_item(product_id, room_id)
		end 	
		items
    end    
end
