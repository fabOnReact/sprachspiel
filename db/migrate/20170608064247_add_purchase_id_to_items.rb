class AddPurchaseIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :purchase_id, :integer
  end
end
