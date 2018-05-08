class ItemsController < ApplicationController
  def index
  	# @items = current_user.items
    @products_count = current_user.items.group(:product).count
    @products = @products_count.keys()    
  end 

  def create
    # binding.pry
    # i = 0 
    # while i <= items_json.size
    #   row = items_json[i.to_s]
    #   row["amount"].to_i.times do
    #     Item.create product_id: row["product_id"]
    #   end
    # end
  end

  def new
    # @product = Product.find(params[:product_id])
    # @product.items.build
    # respond_to do |format| 
    #   format.js
    # end       
  end

  private
  def items_json
    # params.require(:items).permit!.as_json
  end
end