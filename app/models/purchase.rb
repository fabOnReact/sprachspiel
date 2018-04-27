class Purchase < ApplicationRecord
	has_many :items, inverse_of: :purchase
	# belongs_to :room
	# belongs_to :price
	belongs_to :user
	# has_one :sale
	
	accepts_nested_attributes_for :items
	# validate :user_has_money

	scope :price_sum, ->(resource) { joins(:price).sum(resource) }

   def user_has_money
      # the purchase instance still it is not created
      # probably I can do this test after creating the purchase instance
      unless self.user.validation_balance(self.price)
      	errors.add(:price, "Price is too high!")
      end
   end


	def self.creating(room, price, user, selfmade)
		purchase = Purchase.create(room_id: room.id, price_id: price.id, user_id: user.id, selfmade: selfmade)
		return purchase
	end

	def self.new_instance(room, price, user, selfmade)
		@purchase = Purchase.new(room_id: room.id, price_id: price.id, user_id: user.id, selfmade: selfmade)
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
			# i removed index, because now variable is passing the product_id
			#index = index.to_i # -1
			n = nitems.to_i
			#product_id = object[index]
			if user.room_owner(Room.find(room_id))
				self.items << self.create_items(index, room_id, n)
			else 
				# change the selfmade to nil
				# you need to select the correct items
				self.items << Item.where_limit(index, room_id, n)			
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
