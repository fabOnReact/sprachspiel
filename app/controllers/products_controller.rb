class ProductsController < ApplicationController
  def index
    @count = current_user.count_items
    @used = current_user.count_items(:used)
    @sold = current_user.count_items(:sold)
    @products = @count.keys()
  end

  def create; end
  def show; end
end
