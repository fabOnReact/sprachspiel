class SalesController < ApplicationController
	def create 
		@room = Room.find(params[:room_id])
		@purchase = Purchase.find(params[:purchase_id])
		@sale = Sale.new(room_id: params[:room_id], price_id: @purchase.price_id, user_id: current_user.id )
		if @sale.saving(@purchase)
			price = @sale.price
			if @purchase.saving(@sale)
			  	flash[:notice] = "Ihr Verkauf wurde gespeichert! Sie haben #{price.gold} Gold, #{price.wood} Wood, #{price.wood}, Food #{price.food}, #{price.stone} Stone, #{price.metal} Metal verdient"
			  	redirect_to room_path(@room)
		  	end
		else
		  flash[:error] = "Ein Fehler ist aufgetreten, der Verkauf wurde nicht gespeichert"
		  redirect_to room_path(@room)
		end   		
	end

	private 
	def sales_params
	end
end
