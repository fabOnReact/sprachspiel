class RemoteRoomIdFromPurchases < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchases, :room_id, :integer
  end
end
