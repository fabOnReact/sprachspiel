class RemoveRoomIdFromItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :room_id, :integer
  end
end
