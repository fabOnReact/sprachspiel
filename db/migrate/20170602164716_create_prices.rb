class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.integer :gold
      t.integer :wood
      t.integer :food
      t.integer :stone
      t.integer :metal

      t.timestamps
    end
  end
end
