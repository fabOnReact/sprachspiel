class EventsController < ApplicationController
  before_action :find_event, only: [:edit, :update, :show, :destroy]
	before_action :create_event, only: [:create]
	before_action :add_user, only: [:create, :update]

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
		save_and_redirect
  end
  
  def edit; end

  def update 
		# @event.update_attribute(accept, true)
		save_and_redirect
	end

  def show; end

  def destroy
    @event.destroy
    redirect_to events_path, notice: "#{@event.type} successfully deleted"
  end
  
  private
	def create_event
	 	@event = Event.new event_params
	end

  def event_params
    params.require(:event).permit(:type, :name, :description, user_ids: [])
  end  

  def event_type
    params[:type].constantize
  end  

  def find_event
    @event = Event.find params[:id]
  end

	def add_user; binding.pry;
		@event.users << current_user; 
	end

  def save_and_redirect
		if @event.save 
			redirect_to events_path
	 	else 
			flash[:alert] = "Impossible to save event"
			render :index
		end
	end
end
