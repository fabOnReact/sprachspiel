class Product < ApplicationRecord
	extend ProductsHelper

	has_many :items, :dependent => :destroy
	has_many :objects, class_name: "Product", foreign_key: "requirement_id"
	belongs_to :building
	belongs_to :producttype
	belongs_to :price, :dependent => :destroy
	#belongs_to :requirement, class_name: "Product"
end
