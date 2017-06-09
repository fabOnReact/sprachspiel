class RemoveAndAddFieldsFromSales < ActiveRecord::Migration[5.0]
  def change
  	remove_column :sales, :user_id, :integer
  	add_column :sales, :room_id, :integer  	
  end
end
