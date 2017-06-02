class CreateBuldings < ActiveRecord::Migration[5.0]
  def change
    create_table :buldings do |t|
      t.string :name
      t.integer :price_id

      t.timestamps
    end
  end
end
