class ChangeFieldsFromSales < ActiveRecord::Migration[5.0]
  def change
  	remove_column :sales, :item_id, :integer
  	add_column :sales, :invoice_id, :integer  	
  end
end
