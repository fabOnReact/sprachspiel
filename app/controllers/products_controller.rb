class ProductsController < ApplicationController
  def index
    @products = Product.all
  end
  def create
    binding.pry
  end
  def show; end
end
