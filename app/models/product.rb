class Product < ApplicationRecord
	has_many :items, :dependent => :destroy
end
