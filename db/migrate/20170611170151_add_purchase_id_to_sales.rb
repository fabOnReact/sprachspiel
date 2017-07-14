class AddPurchaseIdToSales < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :purchase_id, :integer
  end
end
