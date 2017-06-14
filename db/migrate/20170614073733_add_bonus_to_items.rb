class AddBonusToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :bonus, :boolean
  end
end
