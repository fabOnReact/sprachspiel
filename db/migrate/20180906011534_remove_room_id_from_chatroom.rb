class RemoveRoomIdFromChatroom < ActiveRecord::Migration[5.0]
  def change
		remove_column :chatrooms, :room_id
  end
end
