class AddPropertyIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :property, foreign_key: true
  end
end
