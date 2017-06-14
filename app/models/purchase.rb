class Purchase < ApplicationRecord
	has_many :items
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :sale
	
	accepts_nested_attributes_for :items

	def saving(sale)
		self.sale_id = sale.id
		binding.pry
		# you need to find based on the product building id the purchase room
		self.room_id = self.user.rooms.first.id
		self.save
	end

	def self.creating(room, price, user, bonus )
		Purchase.create(room_id: @room.id, price_id: Price.free.id, user_id: current_user.id, bonus: true)
	end

end
