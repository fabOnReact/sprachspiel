class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user, validate: true
  
  def alignment
    self.id.odd? ? "sent" : "received"
  end  
end
