class Building < ApplicationRecord
	has_many :rooms, :dependent => :destroy
	has_many :products, :dependent => :destroy
	belongs_to :price
end
