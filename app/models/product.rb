class Product < ApplicationRecord
	has_many :items, :dependent => :destroy
	belongs_to :building
end
