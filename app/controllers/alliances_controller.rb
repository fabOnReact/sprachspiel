class AlliancesController < ApplicationController
	before_action :find_alliance, only: [:show, :update] 
	before_action :create_alliance, only: [:create]
	before_action :add_user, only: [:create, :update]
	# after_filter :save_and_redirect, only: [:create, :update]
  def index
    @alliances = Alliance.all
    @alliance = Alliance.new
  end

  def show; @message = Message.new; end
	def new; @alliance = Alliance.new; end
	def create;
  	save_and_redirect
	end
	def update; end

  private
	def create_alliance;
	 	@alliance = Alliance.new alliance_params; end
	def add_user; @alliance.users << current_user; end
	def find_alliance; @alliance = Alliance.find params[:id]; end 

  def alliance_params
    params.require(:alliance).permit(:name, :description, user_ids: [])
  end  

  def save_and_redirect
		if @alliance.save 
			redirect_to alliance_path(@alliance)
	 	else 
			flash[:alert] = "Impossible to save alliance"
			render :index
		end
	end
end
