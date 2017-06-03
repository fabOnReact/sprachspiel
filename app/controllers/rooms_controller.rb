class RoomsController < ApplicationController
  before_action :set_room, only: [:new, :edit]
  before_action :find_room, only: [:update, :show, :destroy]

  def welcome
    @subscription = Subscription.new
  end

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

  def index
    @rooms = Room.all
    @images = ["muehle.svg","kirche.svg","kaserne.svg","palast.svg","dorf.svg"]
    @buildings = Building.all
  end

  def new
  end

  def create
    @room = Building.new(room_params)  
    if @room.save
      flash[:notice] = "Your Building was saved, now you can print your fliers by selecting the print button"
      redirect_to rooms_path
    else
      flash[:error] = "An error occurred, the Building was not saved"
      render "new"
    end     
  end

  def edit
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to rooms_path, notice: 'Building was successfully updated.' }
        format.json { render rooms_path, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end  

  def show
  	@message = Message.new
  end

  def delete
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end

  def room_params
    params.require(:room).permit(:title, :description, :building_id)
  end

  def set_room
    @room = Room.new
  end

  def find_room
    @romm = Room.find(params[:id])
  end

end
