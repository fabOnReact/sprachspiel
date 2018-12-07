class DropTableRooms < ActiveRecord::Migration[5.0]
  def up
    drop_table :rooms 
  end

  def down
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.integer :building_id
      t.integer :user_id
    end
  end
end
