class EventsController < ApplicationController
  def index; @events = current_user.events; end
  def new; end
  def edit; end
end
