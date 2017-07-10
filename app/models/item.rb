class Item < ApplicationRecord
	belongs_to :room
	belongs_to :product

	def self.bonus_items(product, purchase) 
		2.times do  
			Item.create(product_id: product.id, sold: false, used: false, purchase_id: purchase.id, selfmade: true, room_id: Room.king_room.id) 
		end
	end

    def self.where_limit(product_id, room_id, nitems)
    	Item.where(product_id: product_id, sold: false, room_id: room_id).limit(nitems)
    end

    def self.create_item(product_id, room_id)	
    	Item.create(product_id: product_id, room_id: room_id, sold: false, used: false, selfmade: true)
    end
end
