class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :action_id
      t.string :action_type

      t.timestamps
    end
  end
end
