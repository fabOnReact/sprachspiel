class RemoveProducttypeIdFromProducts < ActiveRecord::Migration[5.0]
  def change
   remove_column :products, :producttype_id, :integer
  end
end
