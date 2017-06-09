class Invoice < ApplicationRecord
	#belongs_to :price
	has_one :purchase
	has_one :sale
end
