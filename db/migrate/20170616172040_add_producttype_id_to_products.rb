class AddProducttypeIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :producttype_id, :integer
  end
end
