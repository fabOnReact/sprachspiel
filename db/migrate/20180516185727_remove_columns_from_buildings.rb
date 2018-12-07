class RemoveColumnsFromBuildings < ActiveRecord::Migration[5.0]
  def change
    remove_column :buildings, :name, :string
    remove_column :buildings, :price_id, :integer
    remove_column :buildings, :description, :text
    remove_column :buildings, :role_id, :integer
  end
end
