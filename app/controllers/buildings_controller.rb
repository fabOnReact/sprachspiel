class BuildingsController < ApplicationController
   before_action :set_building, only: [:new, :edit]
   # before_action :product_count, only: [:show, :index]

   def welcome
      if user_signed_in?
         redirect_to buildings_path
      else
         @subscription = Subscription.new
      end
   end

   def createSubscription 
      @subscription = Subscription.new(subscription_params)
      if @subscription.save
         flash[:notice] = "Your Subscription was saved"
         redirect_to root_path
      else
         flash[:error] = "An error occurred, the subscription was not saved"
      	render "welcome"
      end       
   end

   def index
      @rooms = Room.all
      @buildings = Building.order(:id)
   end

   def new
   end

   def edit    	
   end

   def create
      @building = Building.new(building_params)  
      if @building.save
      	flash[:notice] = "Your Building was saved, now you can print your fliers by selecting the print button"
      	redirect_to rooms_path
      else
      	flash[:error] = "An error occurred, the Building was not saved"
      	render "new"
      end	    
   end

   def update
      respond_to do |format|
         if @building.update(building_params)
           format.html { redirect_to rooms_path, notice: 'Building was successfully updated.' }
           format.json { render rooms_path, status: :ok, location: @building }
         else
           format.html { render :edit }
           format.json { render json: @building.errors, status: :unprocessable_entity }
         end
      end
   end

   def show
      @building = Building.find(params[:id])
      @products = @building.products.not_used_items
      @price = Price.new
   end

   def delete
   end  

   def destroy
      @building.destroy
      respond_to do |format|
         format.html { redirect_to rooms_path, notice: 'Building was successfully destroyed.' }
         format.json { head :no_content }
      end
   end

   private

   def building_params
   	params.require(:building).permit(:name, :price_id)
   end

   def set_building
   	@building = Building.new
   end

   def subscription_params
      params.require(:subscription).permit(:email)
   end  
end
