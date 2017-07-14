class AddRoleIdToBuildings < ActiveRecord::Migration[5.0]
  def change
    add_column :buildings, :role_id, :integer
  end
end
