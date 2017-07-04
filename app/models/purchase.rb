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

	def self.create_purchase(room, price, user, params)
		@purchase = Purchase.new_instance(room, price, user, true)
		unless user.room_owner(room)
		  user.clear_purchases(room.id)
		  items = room.items.where(sold: false, used: false).order(:product_id)
    	  @items_number = items.group(:product_id).count   
		  @purchase.fill_with_items(params, @items_number, room.id, user)
		else 
		  @products = room.building.products.order(id: :asc) 
		  @purchase.create_items(params, @products, room.id, user)
		end     
		@purchase.save       
		#binding.pry
	end 

	def items_change_room
		self.items.each do |item|
			room_id = self.user.rooms.first.id
		    item.update_attributes(room_id: room_id)
		end
	end

	def fill_with_items(parameters, object, room_id, user)
		object = Product.hash_keys(object)
		parameters.each do |index, nitems|      	
			index = index.to_i
			n = nitems.to_i
			product_id = object[index]
			# 1 you refactored the method -> _item.html.erb
			if user.room_owner(Room.find(room_id))
				self.items << self.find_items(product_id, room_id, n)
			else 
				self.items << self.create_items(product_id, room_id)
			end
		end 	
    end

	def find_items(product_id, room_id, n)
		items = Item.where_with_limit(product_id, room_id, n)
	end

	def create_items(product_id, room_id, n)
		items = []
		n.times do 
			items << Item.create_item(product_id, room_id)
		end 	
    end    
end
