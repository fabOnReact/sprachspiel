class RemoveReferenceColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :building_id, :integer
    remove_column :items, :sale_id, :integer
    remove_column :items, :room_id, :integer
    # remove_column :items, :owner_id, :integer
    # remove_column :items, :owner_type, :integer
  end
end
