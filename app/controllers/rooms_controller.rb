class RoomsController < ApplicationController
  before_action :find_room, only: [:update, :show, :destroy]

  def createSubscription 
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash[:notice] = "Your Subscription was saved"
      redirect_to action: "welcome"
    else
      flash[:error] = "An error occurred, the subscription was not saved"
      render "welcome"
    end       
  end

  def new
    @building = Building.find(params[:building_id])
    @room = Room.new(building_id: params[:building_id] )
  end

  def create
    @building = Building.find(params[:building_id])    
    @room = Room.new(room_params)  
    @room.user_id = current_user.id
    @room.chatroom = Chatroom.new
    if @room.save 
      flash[:notice] = "Your Room was saved"
      redirect_to buildings_path
    else
      flash[:error] = "An error occurred, the Room was not saved"
      render "new"
    end     
  end

  def edit
    @building = Building.find(params[:building_id])
    @room = Room.find(params[:id])
  end

  def update
    @building = Building.find(params[:building_id])
    @room = Room.find(params[:id])
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
    @room = Room.find(params[:id])
    @chatroom = @room.chatroom
  	@message = Message.new
  end

  def delete
    @building = Building.find(params[:building_id])
    @room = Room.find(params[:id])
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:notice] = "The Room was destroyed"
      redirect_to buildings_path
    else
      flash[:error] = "An error occurred, the room was not saved"
      render "delete"
    end    
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end

  def room_params
    params.require(:room).permit(:title, :description, :building_id)
  end

  def find_room
    @romm = Room.find(params[:id])
  end

end
