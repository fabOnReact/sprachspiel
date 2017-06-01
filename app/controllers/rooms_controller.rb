class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
  end

  def edit
  end

  def show
  	@room = Room.find(params[:id])
  	@message = Message.new
  end

  def delete
  end
end
