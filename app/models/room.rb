class Room < ApplicationRecord
	has_many :purchases, :dependent => :destroy 
	has_many :sales, :dependent => :destroy 
	has_many :items, :dependent => :destroy
	belongs_to :user
	belongs_to :building
	has_one :chatroom, :dependent => :destroy

	validates :title, length: { in: 3..15}

    def self.king_room
    	building = Building.find_by(name: "Palast")
    	room = Room.find_by(building_id: building.id)
    	return room
    end	  
end