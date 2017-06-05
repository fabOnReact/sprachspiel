class ResourcesController < ApplicationController
  def index
  	@resources = Resource.all
  end

  def show
  	@resource = Resource.find(params[:id])
  end
end
