class RemoveAndAddFieldsFromItems < ActiveRecord::Migration[5.0]
  def change
  	remove_column :items, :user_id, :integer
  	add_column :items, :room_id, :integer
  end
end
