class AddBonusToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :bonus, :boolean
  end
end
