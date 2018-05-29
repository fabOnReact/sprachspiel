class EventsController < ApplicationController
  before_filter :find_event, only: [:edit, :update, :destroy]
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

  def update; @event.update_attribute(accept, true); end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "#{@event.type} successfully deleted"
  end
  
  private
  def event_type
    params[:type].constantize
  end  

  def find_event
    @event = Event.find params[:id]
  end
end