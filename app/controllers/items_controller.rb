class ItemsController < ApplicationController
  def index
  	@items = current_user.items.where(sold: false, used: false)
  end 

  def create 
  end

end
