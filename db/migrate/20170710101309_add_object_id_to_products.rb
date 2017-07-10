class AddObjectIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :object_id, :integer
  end
end
