class AddRoomIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :room_id, :integer
  end
end
