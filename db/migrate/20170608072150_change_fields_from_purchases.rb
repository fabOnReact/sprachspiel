class ChangeFieldsFromPurchases < ActiveRecord::Migration[5.0]
  def change
  	remove_column :purchases, :item_id, :integer
  	add_column :purchases, :invoice_id, :integer
  end
end
