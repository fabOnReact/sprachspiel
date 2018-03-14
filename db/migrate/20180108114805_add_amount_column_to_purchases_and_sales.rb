class AddAmountColumnToPurchasesAndSales < ActiveRecord::Migration[5.0]
  def change
   add_column :purchases, :amount, :integer
   add_column :purchases, :end_date, :datetime
   add_column :sales, :amount, :integer
  end
end
