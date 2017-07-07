class AddBuildingIdToDescriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :descriptions, :building_id, :integer
  end
end
