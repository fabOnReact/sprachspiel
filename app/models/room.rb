class Room < ApplicationRecord
	has_many :messages, dependent: :destroy
	has_many :users, through: :messages	
	belongs_to :building

	validates :title, length: { in: 3..15}
end