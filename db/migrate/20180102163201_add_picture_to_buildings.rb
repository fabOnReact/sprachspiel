class AddPictureToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :picture, :string
  end
end
