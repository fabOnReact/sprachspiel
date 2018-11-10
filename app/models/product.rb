class Product < ApplicationRecord
  PRODUCTS = {'sichel' => "sickle.svg",'schwert' => "sword.svg",'achse' => "axe.svg",'bank' => "desk.svg","hammer" => "hammer2.svg",'brot' => 'bread.svg','messer' => "butcher.svg",'ofen' => "stone-oven.svg",'hähnchen' => "meat.svg",'schild' => "shield.svg", 'fisch' => 'fish.svg', 'steak' => 'steak.svg'}
  # BW = ['bank', 'ofen', 'achse']
  has_many :items, :dependent => :destroy
  has_many :objects, class_name: "Product", foreign_key: "requirement_id"
  # has_one :description
  belongs_to :property
  # belongs_to :category
  # replaces with the price field
  # belongs_to :price, :dependent => :destroy
  scope :not_used_items, -> { find_by_sql("SELECT products.name, products.price_id, COUNT(items.id) AS NumberOfItems FROM products INNER JOIN items on products.id = items.product_id GROUP BY products.id;") }
  validates :property, :price, presence: true

  
  def picture
    PRODUCTS[self.name]
  end

  # def bonus
  	#'#{self.property.name} #{self.property.amont}'
  # end
end
