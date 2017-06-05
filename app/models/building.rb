class Building < ApplicationRecord
	has_many :rooms, :dependent => :destroy
	belongs_to :price
end
