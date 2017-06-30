class PurchasesController < ApplicationController
  before_action :set_variables, only: [:create]
  before_action :find_purchase, only: [:show, :delete, :destroy]

  def index
  end

  def new
  end

  def create  
    # perform validation on price, not more then available resources  
    unless current_user.validation_balance(@price)
      flash[:error] = "Der Kaufbetrag ist zu hoch! Du müsst weniger Ressources nutzten"
      redirect_to room_path(@room)      
    else 
      @price.save
      # create purchase
      current_user.purchases.where(room_id: @room.id, sale_id: nil, selfmade: nil).destroy_all
      @purchase = Purchase.new(room_id: params[:room_id], price_id: @price.id, user_id: current_user.id)
      items_number = @items_number.to_a  
      variable_params.each do |index, nitems|
        @purchase.items << Item.where(product_id: items_number[index.to_i][0], sold: false, room_id: @room.id).limit(nitems.to_i)
      end 
      if @purchase.save
        flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
        redirect_to room_path(@room)
      else
        flash[:error] = "Ein Fehler ist aufgetreten, der Kauf wurde nicht gespeichert"
        redirect_to room_path(@room)
      end     
    end      
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
  def variable_params 
  	params.require("variable").permit!
  end

  def price_params
    params.require(:price).permit(:gold, :wood, :food, :stone, :metal)
  end

  def find_purchase 
    @purchase = Purchase.find(params[:id])
  end

  def set_variables
    @room = Room.find(params[:room_id])    
    binding.pry
    if current_user == @room.user
      @price = Price.new(price_params)
    else 
      #@price = 
    end
    @items = @room.items.where(sold: false, used: false).order(:product_id)
    @items_number = @items.group(:product_id).count          
  end    
end
