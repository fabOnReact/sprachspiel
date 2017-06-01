class MessagesController < ApplicationController
  def new
  end

  def create
  	message = Message.new(message_params)
  	message.user = current_user
  	if message.save
  		ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username
      head :ok
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
