class Invoice < ApplicationRecord
	belongs_to :purchase
	belongs_to :sale
	belongs_to :price
end
