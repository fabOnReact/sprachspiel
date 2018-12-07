class Room < ApplicationRecord
   IMAGES = ["muehle.svg","kirche.svg","kaserne.svg","palast.svg","dorf.svg"]
	# has_many :purchases, :dependent => :destroy 
	# has_many :sales, :dependent => :destroy 
	# has_many :items, :dependent => :destroy
	# belongs_to :building
	# has_one :chatroom, :dependent => :destroy

	validates :title, length: { in: 3..15}

   scope :building, ->(id) { find_by(building_id: id)}

   # def self.bonus_items(product, purchase, room) 
   #    2.times do  
   #       Item.create(product_id: product.id, sold: false, used: false, purchase_id: purchase.id, selfmade: true, room_id: room.id) #Room.king_room.id 
   #    end
   # end

   def self.king_room
   	return Room.building(Building.palace.id)
   end	  
end