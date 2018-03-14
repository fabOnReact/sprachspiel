class AddAvatarToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :avatar, :string
  end
end
