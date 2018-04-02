class ItemsController < ApplicationController
  def index
  	@items = current_user.items.where(sold: false, used: false)
  end 

  def create 
  end

  def new
    # use the items helper to toggle the form or write a javascript logic
    # if form.hidden? toggle form

    # How can I find the purchase? Maybe I just add the item and then submit the form?
    # purchase = Purchase.find(params[:purchase_id])
    product = Product.find(params[:product_id])
    @item = Item.new(product: product, user: current_user)
    # add 1 of quantity to the quantity field

    respond_to do |format| 
      format.js
    end
  end
end
