class Item < ApplicationRecord
	belongs_to :room
	belongs_to :product
end
