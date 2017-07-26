class PricesController < ApplicationController
  include Messages
  before_action :set_price, only: [:plus, :minus]
  before_action :set_room, only: [:create, :create_purchase, :plus, :minus]
  #before_action :set_variables, only: [:create]

  def create
    @price = Price.new(price_params)
    if current_user.validation_balance(@price)
      missing_items = Purchase.create_purchase(variable_params, @room, @price, current_user)
      if @price.save && missing_items.empty?
        flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
        redirect_to room_path(@room)
      elsif missing_items.present?
        redirect_to room_path(@room), :flash => { :error => message(missing_items)}
      else
        redirect_to room_path(@room), :flash => { :error => @price.errors.full_messages.join(', ')}
      end
    else
      flash[:error] = "Der Kaufbetrag ist zu hoch! Du müsst weniger Ressources nutzten"
      redirect_to room_path(@room)
    end
  end

  def plus
    if current_user.room_owner(@room)
      respond_to do |format|
        format.js
      end
    end
  end

  def minus
    if current_user.room_owner(@room)    
      respond_to do |format|
        format.js
      end
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
end
