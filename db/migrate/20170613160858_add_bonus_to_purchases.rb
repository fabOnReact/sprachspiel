class AddBonusToPurchases < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :bonus, :boolean
  end
end
