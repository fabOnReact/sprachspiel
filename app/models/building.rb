class Building < ApplicationRecord
	has_many :rooms, :dependent => :destroy
	has_many :products, :dependent => :destroy
	has_many :descriptions, :dependent => :destroy
	belongs_to :price
	belongs_to :role
	has_one :chatroom, :dependent => :destroy

	def room_items(purchase, room)
		self.products.where(bonus: true).each do |product|
	        Item.bonus_items(product, purchase, room)
      	end    
        #room = self.rooms.first
        sale = Sale.creating(purchase, room)
        purchase.update_attributes(sale_id: sale.id, room_id: purchase.user.rooms.first.id)
		sale.saving(purchase)
    end  

	def products_requirements(params, room)
		# find all the products
		# binding.pry
		products = self.products
		missing_items = []			
		# perform the requirement check from the product model
		params.each do |product_id, number|
			if number.to_i > 0
				product = Product.find(product_id)
				missing_item = product.requirement_check(params, room, product) 
				#binding.pry
				missing_items << missing_item if missing_item.present?	
			end
		end
		return missing_items
	end    

	def products_ids
		self.products.order(id: :asc).pluck(:id)
	end
end
