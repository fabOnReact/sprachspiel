class AddChatroomIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :chatroom, foreign_key: true
  end
end
