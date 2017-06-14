class Sale < ApplicationRecord
	has_many :items	
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :purchase

	def saving(purchase) 	
		self.purchase_id = purchase.id
		# now rooms has many items
		#binding.pry
		purchase.items.each do |item| 
			#binding.pry
			item.room_id = purchase.room_id
			item.save
		end

		self.items << purchase.items
		self.save
	end

	def self.creating(purchase, room)
		Sale.create(purchase_id: purchase.id, room_id: room.id, price_id: purchase.price.id, user_id: room.user.id)
	end
end
