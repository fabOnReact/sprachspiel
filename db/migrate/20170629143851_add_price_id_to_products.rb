class AddPriceIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_id, :integer
  end
end
