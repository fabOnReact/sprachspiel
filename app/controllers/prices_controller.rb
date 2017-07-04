class PricesController < ApplicationController
  before_action :set_price, only: [:plus, :minus]
  before_action :set_room, only: [:create, :create_purchase]
  before_action :set_variables, only: [:create]

  def create
    @price = Price.new(price_params)
    if current_user.validation_balance(@price)
      if @price.save && Purchase.create_purchase(@room, @price, current_user, variable_params)
        flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
        redirect_to room_path(@room)
      else
        redirect_to room_path(@room), :flash => { :error => @price.errors.full_messages.join(', ')}
      end
    else
      flash[:error] = "Der Kaufbetrag ist zu hoch! Du müsst weniger Ressources nutzten"
      redirect_to room_path(@room)
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
    #@items = @room.items.where(sold: false, used: false).order(:product_id)
    #@items_number = @items.group(:product_id).count          
  end    
end
