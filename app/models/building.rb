class Building < ApplicationRecord
	has_many :rooms
	belongs_to :price
end