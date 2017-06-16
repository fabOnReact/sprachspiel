class CreateProducttypes < ActiveRecord::Migration[5.0]
  def change
    create_table :producttypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
