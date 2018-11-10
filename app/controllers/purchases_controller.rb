class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_purchase, only: [:show, :delete, :destroy]
  before_action :set_purchase, only: [:create]
  before_action :set_products, only: [:new, :create]
  skip_before_filter :verify_authenticity_token, only: [:new]
  
  # def index
  #   @products_count = current_user.items.group(:product).count #products_count
  #   @products = @products_count.keys()
  # end

  def new
    @product = Product.find params[:product_id] if params[:product_id].present?
    @purchase = Purchase.new
    @chatroom = Chatroom.first
    @message = Message.new
    @messages = @chatroom.messages.order(:created_at)
    respond_to do |format| 
      format.js
      format.html
    end       
  end

  def create
    @purchase.assign_attributes user: current_user
    @purchase.items.map {|item| item.assign_attributes user: current_user }
    if @purchase.save
      render json: { location: events_path, responseJSON: { notice: ["Your purchase was saved"], css_class: "success" }, status: 201 }
    else
      render json: { location: new_purchase_path, responseJSON: { error: @purchase.errors.full_messages }, status: 500 }
    end
  end

  def edit
  end

  private
  def set_purchase
    @purchase = Purchase.new purchase_params
  end

  def set_products
    @products = Product.all
  end

  def purchase_params
    params.require(:purchase).permit(:price, items_attributes:[:product_id])
  end
end
