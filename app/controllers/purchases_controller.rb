class PurchasesController < ApplicationController
  before_action :set_variables, only: [:create]
  before_action :find_purchase, only: [:show, :delete, :destroy]

  def index
  end

  def new
  end

  def price
    @price = Price.new
  end

  def edit
  end

  def show 
    @items_number = @purchase.items.group(:product_id).count
    @room = Room.find(params[:room_id])
  end 

  def delete
    @items_number = @purchase.items.group(:product_id).count
    @room = Room.find(params[:room_id])    
  end

  def destroy
    @room = @purchase.room
    if @purchase.destroy 
      flash[:notice] = "Ihr Kaufangebot wurde gelöscht!"
      redirect_to room_path(@room)
    else
      flash[:error] = "Ein Fehler ist aufgetreten, der Kauf wurde nicht gelöscht"
      redirect_to room_path(@room)
    end        
  end

  private
  def find_purchase 
    @purchase = Purchase.find(params[:id])
  end

  def set_variables
    @room = Room.find(params[:room_id])    
    #@price = Price.new(price_params)
    @items = @room.items.where(sold: false, used: false).order(:product_id)
    @items_number = @items.group(:product_id).count          
  end    
end
