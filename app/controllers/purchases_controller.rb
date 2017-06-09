class PurchasesController < ApplicationController
  before_action :set_variables, only: [:create]

  def index
  end

  def new
  end

  def create    
    binding.pry
    current_user.purchases.where(room_id: @room.id, invoice_id: nil).destroy_all
    items_number = @items_number.to_a
    variable_params.each do |index, nitems|
      @purchase.items << Item.where(product_id: items_number[index.to_i][0], purchase_id: @purchase.id, room_id: @room.id).limit(nitems.to_i)
    end 
    if @purchase.save
      flash[:notice] = "Ihr Kaufangebot wurde gespeichert! Jetzt musst du auf den Verkäufer warten"
      redirect_to room_path(@room)
    else
      #binding.pry 
      flash[:error] = "Ein Fehler ist aufgetreten, der Kauf wurde nicht gespeichert"
      render "rooms/show"
    end           
  end

  def edit
  end

  def delete
  end

  private 
  def variable_params 
  	params.require("variable").permit!
  end

  def price_params
    params.require(:price).permit(:gold, :wood, :food, :stone, :metal)
  end

  def set_variables
    @price = Price.create(price_params)
    @room = Room.find(params[:room_id])
    @items = @room.items.where(sold: false, used: false).order(:product_id)
    @purchase = Purchase.new(room_id: params[:room_id], price_id: @price.id)
    @items_number = @items.group(:product_id).count
  end    
end
