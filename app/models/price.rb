class Price < ApplicationRecord
	has_many :buildings
	has_many :sales
	has_many :products
   # has_one :purchase
	validate :sum_is_not_0
   after_create :set_purchase 

   def set_purchase
      @purchase = Purchase.new(price_id: self.id)
   end

	def self.free
		price = Price.where(gold: 0, wood: 0, food: 0, stone: 0, metal: 0).first
		if price.nil?
			price = Price.new(gold: 0, wood: 0, food: 0, stone: 0, metal: 0)  
			price.save(validate: false)
		end
		return price
	end

	def sum_is_not_0
		if gold == 0 && wood == 0 && food == 0 && stone == 0 && metal == 0
			errors[:base] << 'The total amount needs to be higher then 0'
		end
	end
end
