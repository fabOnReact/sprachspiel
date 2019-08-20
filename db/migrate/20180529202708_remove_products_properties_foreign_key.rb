class RemoveProductsPropertiesForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :property_id, :integer
  end
end