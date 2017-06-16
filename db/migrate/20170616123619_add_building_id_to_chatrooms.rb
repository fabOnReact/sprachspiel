class AddBuildingIdToChatrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chatrooms, :building_id, :integer
  end
end
