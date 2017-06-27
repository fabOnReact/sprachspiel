class RemoveBonusAddSelfmadeToItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :bonus, :boolean
  	add_column :items, :selfmade, :boolean
  end
end
