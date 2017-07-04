class Product < ApplicationRecord
	extend ProductsHelper

	has_many :items, :dependent => :destroy
	belongs_to :building
	belongs_to :producttype
	belongs_to :price, :dependent => :destroy
end
