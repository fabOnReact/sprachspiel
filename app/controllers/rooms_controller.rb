class RoomsController < ApplicationController
  def new
  end

  def edit
  end

  def show
  	@room = Room.find_by(slug: params[:slug])
  	@message = Message.new
  end

  def delete
  end
end
