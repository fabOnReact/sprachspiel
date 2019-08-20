class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :money, :integer, default: 100
    add_column :users, :health, :integer, default: 100
    add_column :users, :defence, :integer, default: 100
    add_column :users, :attack, :integer, default: 100
    add_column :users, :energy, :integer, default: 100
  end
end
