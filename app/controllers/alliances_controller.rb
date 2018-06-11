class AlliancesController < ApplicationController
  def index
    @alliances = Alliance.all
    @alliance = Alliance.new
  end

  # private
  # def alliance_params
  #   params.require(:alliance).permit(:name, :description, user_ids: [])
  # end  
end
