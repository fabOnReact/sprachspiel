class AddProductIdToDescriptions < ActiveRecord::Migration[5.0]
  def change
    add_reference :descriptions, :product, foreign_key: true
  end
end
