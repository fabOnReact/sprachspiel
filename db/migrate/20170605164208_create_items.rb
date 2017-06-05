class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.integer :product_id
      t.boolean :sold
      t.boolean :used

      t.timestamps
    end
  end
end
