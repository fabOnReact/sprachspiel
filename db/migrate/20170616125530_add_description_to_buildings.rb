class AddDescriptionToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :description, :text
  end
end
