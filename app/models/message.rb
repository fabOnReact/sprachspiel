class Message < ApplicationRecord
	belongs_to :chatroom
	belongs_to :user	
  
  def alignment
    self.id.odd? ? "sent" : "received"
  end  
end
