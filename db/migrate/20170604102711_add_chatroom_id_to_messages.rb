class AddChatroomIdToMessages < ActiveRecord::Migration[5.0]
  def change
  	remove_column :messages, :room_id, :integer
  	add_column :messages, :chatroom_id, :integer
  end
end
