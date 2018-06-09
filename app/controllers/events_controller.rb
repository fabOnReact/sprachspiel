class EventsController < ApplicationController
  before_filter :find_event, only: [:edit, :update, :show, :destroy]
  def index
    @events = current_user.reload.events
    @count = current_user.count_items
    @products = @count.keys()
  end
  
  def new
    @event = event_type.new
    @event.users.build
  end

  def create
    @event = Event.new event_params
    @event.users << current_user
    if @event.save
      redirect_to events_path, notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'An error occurred. The alliance was not saved'
      render :new
    end
  end
  
  def edit; end

  def update; @event.update_attribute(accept, true); end

  def show; end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "#{@event.type} successfully deleted"
  end
  
  private
  def event_params
    params.require(:event).permit(:type, :name, :description, user_ids: [])
  end  

  def event_type
    params[:type].constantize
  end  

  def find_event
    @event = Event.find params[:id]
  end
end