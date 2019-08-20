class SubscriptionsController < ApplicationController
  def new; @subscription = Subscription.new; end
  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash[:notice] = "Your Subscription was saved"
      redirect_to root_path
    else
      flash[:error] = "An error occurred, the subscription was not saved"
      render "welcome"
    end       
  end    

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end    
end
