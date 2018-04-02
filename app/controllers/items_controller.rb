class ItemsController < ApplicationController
  def index
  	@items = current_user.items.where(sold: false, used: false)
  end 

  def create 
  end

  def new
    # use the items helper to toggle the form or write a javascript logic
    # if form.hidden? toggle form
    @product = Product.find(params[:product_id])
    respond_to do |format| 
      format.js
    end
  end
end
