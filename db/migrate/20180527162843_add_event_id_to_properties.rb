class AddEventIdToProperties < ActiveRecord::Migration[5.0]
  def change
    add_reference :properties, :event, foreign_key: true
  end
end
