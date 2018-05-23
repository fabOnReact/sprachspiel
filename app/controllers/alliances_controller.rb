class AlliancesController < ApplicationController
  def index; end
  def new; 
    @alliance = Alliance.new
    @alliance.users.build
  end
  def edit; end
end
