class Price < ApplicationRecord
	has_many :buildings
	has_many :purchases
	has_many :sales
end
