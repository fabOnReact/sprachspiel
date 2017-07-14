class AddFieldsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :sale_id, :integer
  end
end
