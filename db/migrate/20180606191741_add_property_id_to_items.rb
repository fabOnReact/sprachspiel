class AddPropertyIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :property, foreign_key: true
  end
end
