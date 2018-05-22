class AddAllianceIdToCategories < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :alliance, foreign_key: true
  end
end
