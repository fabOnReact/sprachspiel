class Category < ApplicationRecord
   # has_many :products
   
   # scope :type, ->(product_type){ where(category_id: product)}
   # type.products
   # .joins(:items).where(items: { sold: false, used: false })
   
   # refactoring to be finished later. You need to find how many items for sale every room has based on that 
   # product type
   def product_count     
      # @products = Product.joins(:items).where(items: { sold: false, used: false})
      # @products_count = @products.
      # Category.all.map { |type| }
      # Room.joins(:items).where(items: { sold: false, used: false})


      @product_count = []
      @products = []
      i = 0
      Category.all.each do |category|
        @products << Product.where(category_id: category.id).joins(:items).where(items: { sold: false, used: false })
        @product_count << @products[i].group("items.room_id").count
        i += 1
      end
   end 
end

