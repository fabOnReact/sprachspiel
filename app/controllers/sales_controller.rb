class SalesController < ApplicationController
	def create 
		@room = Room.find(params[:room_id])
		@purchase = Purchase.find(params[:purchase_id])
		@sale = Sale.new(room_id: params[:room_id], price_id: @purchase.price_id, user_id: current_user.id )
		#@invoice = Invoice.new(purchase_id: params[:purchase_id])
		@sale.purchase_id = @purchase.id
		@purchase.items.each do |item| 
			item.sold = true
		end
		@sale.items << @purchase.items
		price = @sale.price
		if @sale.save 
			@purchase.sale_id = @sale.id
			@purchase.room_id = @purchase.user.rooms.first.id
			if @purchase.save
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
