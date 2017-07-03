class PricesController < ApplicationController
  before_action :set_price, only: [:plus, :minus]
  before_action :set_room, only: [:create, :create_purchase]
  before_action :set_variables, only: [:create]

  def create
    #binding.pry
    @price = Price.new(price_params)
    if current_user.validation_balance(@price)
      if @price.save
        create_purchase #redirect_to action: "
      else
        @price.errors.full_messages.each do |msg| 
          flash[:error] = "#{msg}"
        end
        redirect_to room_path(@room), :flash => { :error => @price.errors.full_messages.join(', ')}
      end
    else
      flash[:error] = "Der Kaufbetrag ist zu hoch! Du müsst weniger Ressources nutzten"
      redirect_to room_path(@room)
    end
  end

  def create_purchase
    unless current_user == @room.user
      current_user.purchases.where(room_id: @room.id, sale_id: nil, selfmade: nil).destroy_all
      @purchase = Purchase.new(room_id: params[:room_id], price_id: @price.id, user_id: current_user.id)
      items_number = @items_number.to_a  
      binding.pry
      variable_params.each do |index, nitems|
        @purchase.items << Item.where(product_id: items_number[index.to_i][0], sold: false, room_id: @room.id).limit(nitems.to_i)
      end 
      if @purchase.save
        flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
        redirect_to room_path(@room)
      else
        flash[:error] = "Ein Fehler ist aufgetreten, der Kauf wurde nicht gespeichert."
        redirect_to room_path(@room)
      end         
    else 

    end
  end

  def plus
    respond_to do |format|
      format.js
    end
  end

  def minus
    respond_to do |format|
      format.js
    end
  end

  private 
  def price_params
    params.require(:price).permit(:gold, :wood, :food, :stone, :metal)
  end

  def item_params
    params.require("item").permit!
  end

  def variable_params 
    params.require("variable").permit!
  end

  def set_price
    @price = Price.find(params[:id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_variables
    #binding.pry
    @items = @room.items.where(sold: false, used: false).order(:product_id)
    @items_number = @items.group(:product_id).count          
  end    
end
