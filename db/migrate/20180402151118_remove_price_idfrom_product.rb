class RemovePriceIdfromProduct < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :price_id, :integer
  end
end
