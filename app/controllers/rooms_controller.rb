class RoomsController < ApplicationController
  def welcome
    @subscription = Subscription.new
  end

  def createSubscription 
    @subscription = Subscription.new(input_params)
    if @subscription.save
      flash[:notice] = "Your Subscription was saved"
      redirect_to action: "welcome"
    else
      flash[:error] = "An error occurred, the subscription was not saved"
      render "welcome"
    end       
  end

  def index
    @rooms = Room.all
  end

  def new
  end

  def edit
  end

  def show
  	@room = Room.find(params[:id])
  	@message = Message.new
  end

  def delete
  end

  private
  def input_params
    params.require(:subscription).permit(:email)
  end

end
