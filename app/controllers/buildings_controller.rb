class BuildingsController < ApplicationController
  before_action :set_building, only: [:new, :edit]

  def index
    @rooms = Room.all
    @images = ["muehle.svg","kirche.svg","kaserne.svg","palast.svg","dorf.svg"]
    @buildings = Building.all
  end
  
  # GET /buildings/new
  def new
  end

  # GET /buildings/1/edit
  def edit    	
  end

  # POST /buildings
  # POST /buildings.json
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

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
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

  # GET /buildings/1
  # GET /buildings/1.json
  def show
	@building = Building.find(params[:id])
  end

  def delete
  end  


  # DELETE /buildings/1
  # DELETE /buildings/1.json
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
end
