class PricesController < ApplicationController
	include Messages
	before_action :set_price, only: [:plus, :minus]
	before_action :set_room, only: [:create, :plus, :minus]
	#before_action :set_variables, only: [:create]

   accepts_nested_attributes_for :purchase

	def create
   	@price = Price.new(price_params)
   	@price.purchase.user = current_user
   	if @price.save
   	   flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
         redirect_to room_path(@room)
      else
      	# remember to show errors in the form
         flash[:alert] = "Sorry an Error occurred and the purchase was not saved"
         render :new
      end
	end

	# # needs to be refactored
	# def plus
	# 	if current_user.room_owner(@room)
	# 		respond_to do |format|
	# 			format.js
	# 		end
	# 	end
	# end

	# def minus
	# 	if current_user.room_owner(@room)    
	# 		respond_to do |format|
	# 			format.js
	# 		end
	# 	end
	# end

	private 

	# def price_params
	# 	params.require(:price).permit(:gold, :wood, :food, :stone, :metal)
	# end

	def item_params
		params.require("item").permit!
	end

	def variable_params 
		params.require("variable").permit!
	end

	def set_price
		@price = Price.find(params[:id])
	end

	def price_params
		params.require(:price).permit(:gold, :wood, :food, :stone, :metal, purchases_attributes: [])
	end

	def set_room
		@room = Room.find(params[:room_id])
	end
end