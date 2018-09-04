class AlliancesController < ApplicationController
  def index
    @alliances = Alliance.all
    @alliance = Alliance.new
  end

  def show; end

	def new; @alliance = Alliance.new; end
	
	def update
		@alliance = Alliance.find params[:id]
		@alliance.users << current_user
		if @alliance.save 
			redirect_to :show
		else 
			flash[:alert] = "Impossible to join alliance"
			render :index
		end
	end

  # private
  # def alliance_params
  #   params.require(:alliance).permit(:name, :description, user_ids: [])
  # end  
end
