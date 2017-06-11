class Purchase < ApplicationRecord
	has_many :items
	belongs_to :room
	belongs_to :price
	belongs_to :user
	has_one :sale
	
	accepts_nested_attributes_for :items
end
