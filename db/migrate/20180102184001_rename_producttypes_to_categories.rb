class RenameProducttypesToCategories < ActiveRecord::Migration[5.0]
  def change
   rename_table :producttypes, :categories
  end
end
