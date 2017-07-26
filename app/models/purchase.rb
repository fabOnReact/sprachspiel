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
		@purchase = Purchase.new_instance(room, price, user, true)
		if user.room_owner(room)
			# find all the products
			products = room.building.products
			# Collect the products id requirement
			product_ids = room.building.products.order(id: :asc).pluck(:id)
			missing_items = []			
			products.each do |product|
				# you need to finish this method
				if product.requirement_id.present?
					requirement = Product.find(product.requirement_id)
					# check if the user has enought items
					number = params[product.id.to_s].to_i 
					requirement_items = room.items.where(id: requirement.id).limit(number)
					# if the product has a requirement and was set for purchase					
					if requirement.present? && number > 0	
					  	unless requirement_items.size < number
					  		requirement_items.each do |item|
					  			# the item is used to create a new one
					  			item.used!
					  		end
					  	else
					  		# if the required items are not available save an error message
					  		missing_items << 
					  		# product.requirement_check(params, requirement_items)
					  	end
					end					
				end
			end
			# The model method will return true or false if errors are included
			if missing_items.present?
				return missing_items 
			else 
				# the item is created
				@purchase.fill_with_items(params, product_ids, room.id, user)
			end
		else 
			# If a customer comes to the room, there is no requirement
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
