class RemoveProductAndAvatarFromBuildings < ActiveRecord::Migration[5.0]
	def change
		remove_column :buildings, :picture, :string
		remove_column :buildings, :avatar, :string
		remove_column :products, :picture, :string
	end
end
