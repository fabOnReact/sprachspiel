class AddBuildingIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :building_id, :integer
  end
end
