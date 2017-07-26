class PricesController < ApplicationController
  include Messages
  before_action :set_price, only: [:plus, :minus]
  before_action :set_room, only: [:create, :create_purchase, :plus, :minus]
  #before_action :set_variables, only: [:create]

  def create
    @price = Price.new(price_params)
    if current_user.validation_balance(@price)
      # use the methods just created to execute separately the requirement check
      # then if ok run the purchase and price creation process 
      building = @room.building
      missing_items = @room.building.products_requirements(variable_params, @room)
      owner = current_user.room_owner(@room)
      if @price.save
        binding.pry
        if owner && missing_items.empty?
          @purchase = Purchase.new_instance(@room, @price, current_user, true)
          binding.pry
          @purchase.fill_with_items(variable_params, building.products_ids, @room.id, current_user)
          if @purchase.save 
            flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
            redirect_to room_path(@room)
          else
            flash[:alert] = "Error"
          end
        elsif owner && missing_items.present?
          redirect_to room_path(@room), :flash => { :error => message(missing_items)}
        else
          user.clear_purchases(room.id)
          items = room.items.where(sold: false, used: false).order(:product_id)
          items_number = items.group(:product_id).count
          @purchase.fill_with_items(params, items_number, @room.id, current_user)
          @purchase.selfmade = nil
          if @purchase.save 
            flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
            redirect_to room_path(@room)
          else
            flash[:alert] = "Error"
            redirect_to room_path(@room)
          end
        end
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
