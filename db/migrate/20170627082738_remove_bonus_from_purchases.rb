class RemoveBonusFromPurchases < ActiveRecord::Migration[5.0]
  def change
  	remove_column :purchases, :bonus, :boolean
  end
end
