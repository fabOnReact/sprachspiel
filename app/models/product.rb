class Product < ApplicationRecord
	has_many :items, :dependent => :destroy
	belongs_to :building
	belongs_to :producttype
end
