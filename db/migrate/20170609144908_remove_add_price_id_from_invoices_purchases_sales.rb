class RemoveAddPriceIdFromInvoicesPurchasesSales < ActiveRecord::Migration[5.0]
  def change
  	remove_column :invoices, :price_id, :integer
  	add_column :purchases, :price_id, :integer
  	add_column :sales, :price_id, :integer
  end
end
