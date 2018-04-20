class PurchasesController < ApplicationController
  # before_action :set_variables, only: [:create]
  before_action :find_purchase, only: [:show, :delete, :destroy]

  def index
  end

  def new
    @purchase = Purchase.new
    2.times { @purchase.items.new }
    @products = Product.all 
    
    if params[:product_id]
      @product = Product.find(params[:product_id])
      @purchase.items.new product: @product
    end

    respond_to do |format| 
      format.js
      format.html
    end       
  end

  def create
    # binding.pry
    # @purchase = Purchase.new purchase_params
    # @purchase.user_id = current_user
    # @purchase.valid?
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

  # def purchase_params
  #   params.require(:purchase).permit(items_attributes:[:product_id])
  # end

  # def set_variables
  #   @room = Room.find(params[:room_id])    
  #   #@price = Price.new(price_params)
  #   @items = @room.items.where(sold: false, used: false).order(:product_id)
  #   @items_number = @items.group(:product_id).count          
  # end    
end
