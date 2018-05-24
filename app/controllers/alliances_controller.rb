class AlliancesController < ApplicationController
  def index; end
  def new; 
    @alliance = Alliance.new
    @alliance.users.build
  end

  def create
    @alliance = Alliance.new alliance_params
    # binding.pry
    if @alliance.save
      redirect_to events_path, notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'An error occurred. The alliance was not saved'
      render :new
    end
  end

  def edit; end

  private
  def alliance_params
    params.require(:alliance).permit(:name, :description, user_ids: [:id])
  end  
end
