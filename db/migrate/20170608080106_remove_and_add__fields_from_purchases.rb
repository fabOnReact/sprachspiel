class RemoveAndAddFieldsFromPurchases < ActiveRecord::Migration[5.0]
  def change
  	remove_column :purchases, :user_id, :integer
  	add_column :purchases, :room_id, :integer
  end
end
