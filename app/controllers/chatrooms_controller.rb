class ChatroomsController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    # @building = Building.find(params[:building_id]) if params[:building_id].present?
    # @room = Room.find(params[:room_id]) if params[:room_id].present?
    @chatroom = Chatroom.first
    @message = Message.new  
    @messages = @chatroom.messages.order(:created_at)
  end

  def delete
  end
end
