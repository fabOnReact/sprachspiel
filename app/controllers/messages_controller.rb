class MessagesController < ApplicationController
  #before_action :authenticate_user!, :except => [:show]
  def new
  end

  def create
  	message = Message.new(message_params)
  	message.user = current_user
    chatroom = message.chatroom
  	if message.save
  		ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.name,
        lastuser: chatroom.messages.last(2)[0].user.name
      head :ok
  	else
      #flash[:error] = "You need to signup or login to play"
      #render "rooms/show"
    end
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
