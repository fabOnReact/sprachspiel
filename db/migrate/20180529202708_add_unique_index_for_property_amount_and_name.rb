class AddUniqueIndexForPropertyAmountAndName < ActiveRecord::Migration[5.0]
  def change
    add_index :properties, [:name, :amount], unique: true
  end
end
