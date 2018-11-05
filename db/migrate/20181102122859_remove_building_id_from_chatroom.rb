class RemoveBuildingIdFromChatroom < ActiveRecord::Migration[5.0]
  def change
    remove_column :chatrooms, :building_id, :integer
  end
end
