class Product < ApplicationRecord
  PRODUCTS = {'sichel' => "004-sickle",'schwert' => "002-sword",'achse' => "005-axe",'bank' => "015-office","hammer" => "003-hammer",'brot' => '007-bread','messer' => "044-butcher",'ofen' => "020-stone-oven",'hähnchen' => "017-meat",'schild' => "019-shield", 'fisch' => '016-fish', 'steak' => '018-steak'}
  has_many :items, :dependent => :destroy
  has_many :objects, class_name: "Product", foreign_key: "requirement_id"
  belongs_to :property
  scope :not_used_items, -> { find_by_sql("SELECT products.name, products.price_id, COUNT(items.id) AS NumberOfItems FROM products INNER JOIN items on products.id = items.product_id GROUP BY products.id;") }
  validates :property, :price, presence: true
  
  def picture
    PRODUCTS[self.name]
  end
end
