class InventoriesController < ApplicationController
	def index
		@stocks = Stock.where(user_id: current_user.id).sum(:quantity)		
	end
end
