class MessagesController < ApplicationController
  before_action :set_message, only: :create

  def create
  	if @message.save
  		ActionCable.server.broadcast 'messages',
        alignment: @message.alignment,
        message: @message.content,
        user: @message.user.name,
        chatroom_id: @message.chatroom_id        
      head :ok
  	else
      binding.pry
      flash[:error] = "The message was not saved"
    end
  end
  
  private
  def set_message
    @message = Message.new(message_params)
    @message.chatroom = Chatroom.first
    @message.user = user_signed_in? ? current_user : User.guest
  end

  def message_params
  	params.require(:message).permit(:content)
  end
end
