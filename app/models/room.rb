class Room < ApplicationRecord
	belongs_to :user
	belongs_to :building
	has_one :chatroom, :dependent => :destroy

	validates :title, length: { in: 3..15}
end