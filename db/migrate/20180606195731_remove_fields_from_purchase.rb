class RemoveFieldsFromPurchase < ActiveRecord::Migration[5.0]
  def change
    remove_column :purchases, :invoice_id, :integer
    remove_column :purchases, :price_id, :integer
    remove_column :purchases, :sale_id, :integer
    remove_column :purchases, :amount, :integer
  end
end