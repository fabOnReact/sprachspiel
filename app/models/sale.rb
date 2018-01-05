class Sale < ApplicationRecord
	# has_many :items	
	# belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :purchase

	scope :price_sum, ->(resource) { joins(:price).sum(resource) }
end
