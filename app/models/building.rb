class Building < ApplicationRecord
   IMAGES = ["muehle.svg","kirche.svg","kaserne.svg","palast.svg","dorf.svg"]
   PICTURES = {"Landwirtschaft"=>{"picture"=>"grain.svg", "avatar"=>"muehle.svg"}, "Schmied"=>{"picture"=>"hammer.svg", "avatar"=>"anvil.svg"}, "Armee"=>{"picture"=>"battle.svg", "avatar"=>"armor.svg"},"Palast"=>{"picture"=>"chess.png", "avatar"=>"king.svg"}}  
   IDS = ["online", "tools", "weapons", "food"] 
	
   # has_many :rooms, :dependent => :destroy
	has_many :products, :dependent => :destroy
	has_many :descriptions, :dependent => :destroy
	# belongs_to :price
	# belongs_to :role
	has_one :chatroom, :dependent => :destroy

   scope :palace, -> { find_by(name: "Palast")}

   def picture
      PICTURES[self.name]["picture"]
   end

   def avatar
      PICTURES[self.name]["avatar"]
   end

	def products_requirements(params, room)
		# find all the products
		products = self.products
		missing_items = []			
		# perform the requirement check from the product model
		params.each do |product_id, number|
			if number.to_i > 0
				product = Product.find(product_id)
				missing_item = product.requirement_check(params, room, product) 
				missing_items << missing_item if missing_item.present?	
			end
		end
		return missing_items
	end    

	def products_ids
		self.products.reload.order(id: :asc).pluck(:id)
	end
end
