class AlliancesController < ApplicationController
	before_filter :find_alliance, on: [:show, :update] 
	before_filter :create_alliance, on: [:create]
	before_filter :add_user, on: [:create, :update]
	after_filter :save_and_redirect, on: [:create, :update]
  def index
    @alliances = Alliance.all
    @alliance = Alliance.new
  end

  def show; @message = Message.new; end
	def new; @alliance = Alliance.new; end
	def create; end
	def update; end

  private
	def create_user; @alliance = Alliance.new alliance_params; end
	def add_user; @alliance.users << current_user; end
	def find_user; @alliance = Alliance.find params[:id]; end 
	
  def save_and_redirect
		if @alliance.save; redirect_to :show;
	 	else; 
			flash[:alert] = "Impossible to create alliance"
			render :index
		end
	end

  def alliance_params
    params.require(:alliance).permit(:name, :description, user_ids: [])
  end  
end
