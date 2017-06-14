class Item < ApplicationRecord
	belongs_to :room
	belongs_to :product

	def self.bonus_items(product, purchase) 
		4.times do  
			Item.create(product_id: product.id, sold: false, used: false, purchase_id: purchase.id, bonus: true, room_id: Room.king_room.id) 
		end
	end
end
