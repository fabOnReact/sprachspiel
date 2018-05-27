class EventsController < ApplicationController
  def index
    @events = current_user.events
    @count = current_user.count_items
    @products = @count.keys()
  end
  
  def new
    @event = event_type.new
    @event.users.build
  end
  
  def edit; end

  private
  def event_type
    params[:type].constantize
  end  
end