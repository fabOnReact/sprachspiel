class Price < ApplicationRecord
	has_many :buildings
	has_many :purchases
	has_many :sales
	has_many :products

	validate :sum_is_not_0

	def self.free
		price = Price.create(gold: 0, wood: 0, food: 0, stone: 0, metal: 0)
	end

	def sum_is_not_0
		if gold == 0 && wood == 0 && food == 0 && stone == 0 && metal == 0
			#binding.pry
			errors[:base] << 'The total amount needs to be higher then 0'
		end
	end

end
