class MessagesController < ApplicationController
  #before_action :authenticate_user!, :except => [:show]
  def new
  end

  def create
    #binding.pry
  	message = Message.new(message_params)
  	message.user = current_user
  	if message.save
  		ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.email
      head :ok
  	end
    #binding.pry
  end

  def edit
  end

  def show
  end

  def delete
  end

  private

  def message_params
  	params.require(:message).permit(:content, :chatroom_id)
  end

end
