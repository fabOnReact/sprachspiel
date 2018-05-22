class AddAllianceIdToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :alliance, foreign_key: true
  end
end
