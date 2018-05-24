class EventsController < ApplicationController
  def index; 
    @events = current_user.events
    @count = current_user.count_items
    @products = @count.keys()
  end
  
  def new; end
  def edit; end
end