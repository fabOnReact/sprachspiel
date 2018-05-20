class AlliancesController < ApplicationController
  def index
  end

  def new
    @alliances = current_user.events.alliances
    @alliance = Alliance.new
  end

  def edit
  end
end
