class Purchase < ApplicationRecord
	has_many :items
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :sale
	
	accepts_nested_attributes_for :items

	def self.creating(room, price, user, bonus )
		Purchase.create(room_id: room.id, price_id: price.id, user_id: user.id, bonus: bonus)
	end

	def items_change_room
		self.items.each do |item|
			room_id = self.user.rooms.first.id
		    item.update_attributes(room_id: room_id)
		end
	end

end
