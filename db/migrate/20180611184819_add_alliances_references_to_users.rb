class AddAlliancesReferencesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :alliance, foreign_key: true
  end
end
