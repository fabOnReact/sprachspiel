class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.integer :purchase_id
      t.integer :sale_id
      t.integer :price_id

      t.timestamps
    end
  end
end
