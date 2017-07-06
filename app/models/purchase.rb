class Purchase < ApplicationRecord
	has_many :items
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :sale
	
	accepts_nested_attributes_for :items

	def self.creating(room, price, user, selfmade)
		Purchase.create(room_id: room.id, price_id: price.id, user_id: user.id, selfmade: selfmade)
	end

	def self.new_instance(room, price, user, selfmade)
		@purchase = Purchase.new(room_id: room.id, price_id: price.id, user_id: user.id, selfmade: selfmade)
	end

	def self.create_purchase(params, room, price, user)
		@purchase = Purchase.new_instance(room, price, user, true)
		if user.room_owner(room)
		  product_ids = room.building.products.order(id: :asc).pluck(:id)
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
