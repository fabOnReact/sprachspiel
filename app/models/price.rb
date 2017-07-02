class Price < ApplicationRecord
	has_many :buildings
	has_many :purchases
	has_many :sales
	has_many :products

	validates :gold, numericality: { greater_than: 0}	

	def self.free
		price = Price.create(gold: 0, wood: 0, food: 0, stone: 0, metal: 0)
	end

end
