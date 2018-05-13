class ProductsController < ApplicationController
  def index
    @products_count = current_user.items.group(:product).count
    @products = @products_count.keys()       
  end
  def create; end
  def show; end
end
