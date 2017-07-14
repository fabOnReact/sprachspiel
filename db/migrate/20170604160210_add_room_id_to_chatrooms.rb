class AddRoomIdToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :room_id, :integer
  end
end
