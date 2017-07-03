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

	def items_change_room
		self.items.each do |item|
			room_id = self.user.rooms.first.id
		    item.update_attributes(room_id: room_id)
		end
	end

	def fill_with_items(parameters, object, room_id)
		keys = object.keys if object.class == Hash
		parameters.each do |index, nitems|      	
			index = index.to_i
			n = nitems.to_i
			if object.class == Hash 
				product_id = keys[index] 
			else
				product_id = object[index].id
			end
			self.items << Item.where_limit(product_id, room_id, n)
		end 	
    end
end
