class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def show; end
  def changeIcon    
  end
end
