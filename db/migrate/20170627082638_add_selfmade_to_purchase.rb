class AddSelfmadeToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :selfmade, :boolean
  end
end
