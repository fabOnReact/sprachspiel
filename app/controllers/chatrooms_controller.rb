class ChatroomsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @building = Building.find(params[:building_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new  
  end

  def delete
  end
end
