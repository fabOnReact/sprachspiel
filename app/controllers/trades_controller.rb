class TradesController < ApplicationController
  def new
    @trade = Trade.new
    @trade.users.build
  end

  def create
    @trade = Trade.new trade_params
    if @trade.save
      redirect_to events_path, notice: 'Post was successfully created.'
    else
      flash.now[:alert] = 'An error occurred. The trade was not saved'
      render :new
    end
  end

  def edit; end

  private
  def trade_params
    params.require(:trade).permit(:name, :description, user_ids: [])
  end  
end
