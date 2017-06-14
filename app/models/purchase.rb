class Purchase < ApplicationRecord
	has_many :items
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :sale
	
	accepts_nested_attributes_for :items

	def self.creating(room, price, user, bonus )
		binding.pry
		Purchase.create(room_id: room.id, price_id: price.id, user_id: user.id, bonus: bonus)
	end

end
