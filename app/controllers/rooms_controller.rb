class RoomsController < ApplicationController
  before_action :find_room, only: [:update, :show, :destroy, :delete, :edit, :update, :destroy]
  before_action :find_building, only: [:new, :create, :edit, :update, :delete ]  

  def index
  end

  def new
    @room = Room.new(building_id: params[:building_id] )    
  end

  def create    
    @room = Room.new(room_params, user_id: current_user.id)  
    #@room.user_id = current_user.id
    @room.chatroom = Chatroom.new
    if @room.save 
      @purchase = Purchase.creating(@room, Price.free, current_user, true)
      @building.room_items(@purchase)
      flash[:notice] = "Your Room was saved"
      redirect_to buildings_path
    else
      flash[:error] = "An error occurred, the Room was not saved"
      render "new"
    end     
  end

  def edit
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to buildings_path, notice: 'Room was successfully updated.' }
        format.json { render buildings_path, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end  

  def show
    @chatroom = @room.chatroom       
  	@message = Message.new
    @purchases = Purchase.where(sale_id: nil, room_id: @room.id, selfmade: nil)
    purchase
  end

  def purchase
    # Filling the Price Form
    @price = Price.new    
    # Items from that room (including those purchased from other rooms)
    @items = @room.items.where(sold: false, used: false).order(:product_id)
    # Filling the Purchase Form
    @purchase = Purchase.new(room_id: @room.id)
    #@purchase.items << @items 
    @items_number = @items.group(:product).count 
    # Items that do not belong to that room
    @items = @room.items.where.not(product: @room.building.products)
    @products = @items.select(:product_id).distinct
    @items_count = @items.group(:product).count    
  end

  def purchases
  end

  def delete
  end

  def destroy
    if @room.destroy
      flash[:notice] = "The Room was destroyed"
      redirect_to buildings_path
    else
      flash[:error] = "An error occurred, the room was not saved"
      render "delete"
    end    
  end

  private
  def room_params
    params.require(:room).permit(:title, :description, :building_id)
  end

  def price_params
    params.require(:price).require()
  end

  def find_room
    @room = Room.find(params[:id])
  end

  def find_building
    @building = Building.find(params[:building_id])
  end
end
