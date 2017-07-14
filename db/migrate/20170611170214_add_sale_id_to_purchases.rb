class AddSaleIdToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :sale_id, :integer
  end
end
