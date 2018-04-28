class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_purchase, only: [:show, :delete, :destroy]
  before_action :set_purchase, only: [:create]
  before_action :set_products, only: [:new, :create]

  # def index
  #   @products_count = current_user.items.group(:product).count #products_count
  #   @products = @products_count.keys()
  # end

  def new
    @product = Product.find params[:product_id] if params[:product_id].present?
    @purchase = Purchase.new
    respond_to do |format| 
      format.js
      format.html
    end       
  end

  def create
    @purchase.assign_attributes user: current_user
    if @purchase.save
      render json: { location: root_path, flash: {:notice => ["Your purchase was saved"]}, css_class: "success" }
    else
      render json: { error: @purchase.errors.full_messages }, status: 422
    end
  end

  def edit
  end

  # def show 
  #   @items_number = @purchase.items.group(:product_id).count
  #   @room = Room.find(params[:room_id])
  # end 

  # def delete
  #   @items_number = @purchase.items.group(:product_id).count
  #   @room = Room.find(params[:room_id])    
  # end

  # def destroy
  #   @room = @purchase.room
  #   if @purchase.destroy 
  #     flash[:notice] = "Ihr Kaufangebot wurde gelöscht!"
  #     redirect_to room_path(@room)
  #   else
  #     flash[:error] = "Ein Fehler ist aufgetreten, der Kauf wurde nicht gelöscht"
  #     redirect_to room_path(@room)
  #   end        
  # end

  # def sold
  #   @room = Room.find(params[:room_id])
  #   @purchase = Purchase.find(params[:id])
  #   @sale = Sale.new(room_id: params[:room_id], price_id: @purchase.price_id, user_id: current_user.id )
  #   if @sale.saving(@purchase)
  #     price = @sale.price
  #     if @purchase.update_attributes(sale_id: @sale.id, room_id: @purchase.user.rooms.first.id)
  #       @purchase.items_change_room
  #       flash[:notice] = "Ihr Verkauf wurde gespeichert! Sie haben #{price.gold} Gold, #{price.wood} Wood, #{price.wood}, Food #{price.food}, #{price.stone} Stone, #{price.metal} Metal verdient"
  #       redirect_to room_path(@room)
  #     end
  #   else
  #     flash[:error] = "Ein Fehler ist aufgetreten, der Verkauf wurde nicht gespeichert"
  #     redirect_to room_path(@room)
  #   end  
  # end

  private
  # def find_purchase 
  #   @purchase = Purchase.find(params[:id])
  # end

  def set_purchase
    @purchase = Purchase.new purchase_params
  end

  def set_products
    @products = Product.all
  end

  def purchase_params
    params.require(:purchase).permit(:price, items_attributes:[:product_id])
  end

  # def set_variables
  #   @room = Room.find(params[:room_id])    
  #   #@price = Price.new(price_params)
  #   @items = @room.items.where(sold: false, used: false).order(:product_id)
  #   @items_number = @items.group(:product_id).count          
  # end    
end
