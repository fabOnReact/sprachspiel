class AddChatroomIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :chatrooms, foreign_key: true
  end
end
