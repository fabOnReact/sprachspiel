class PricesController < ApplicationController

  def plus
    @price = Price.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def minus
    @price = Price.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

end
