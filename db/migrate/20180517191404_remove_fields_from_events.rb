class RemoveFieldsFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_column :events, :action_id, :integer
    remove_column :events, :action_type, :integer
    add_column :events, :type, :string
  end
end
