class Room < ApplicationRecord
	has_many :purchases
	has_many :sales
	has_many :items, through: :purchases
	#has_many :items, through: :sales
	belongs_to :user
	belongs_to :building
	has_one :chatroom, :dependent => :destroy

	validates :title, length: { in: 3..15}
end