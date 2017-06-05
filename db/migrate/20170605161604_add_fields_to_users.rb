class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gold, :integer
    add_column :users, :wood, :integer
    add_column :users, :food, :integer
    add_column :users, :stone, :integer
    add_column :users, :metal, :integer
  end
end
