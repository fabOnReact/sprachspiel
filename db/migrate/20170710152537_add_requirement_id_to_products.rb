class AddRequirementIdToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :requirement_id, :integer
  end
end
