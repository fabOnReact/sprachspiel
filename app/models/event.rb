class Event < ApplicationRecord
  TYPES = %w[Alliance Trade Fight Building]
  CATEGORIES = {Alliance: :Waffen, Trade: [:Werkzeuge, :Lebensmittel]}
  EVENTS_HEADERS = %w[Participants Bonus Options]
  INVENTORIES_HEADERS = %w[Product N Bonus]   
  # IMAGES = { "Alliance" => "manuscript", "Fight" => "helmet", "Building" => "castle", "Trade" => "money-bag" }
  has_and_belongs_to_many :users
  has_many :items
  has_one :category

  TYPES.each do |type|
    scope type.downcase, -> { where(type: type) }
  end

  def self.image
    IMAGES[self.to_s]
  end

  # def self.inherited(child)
  #   child.instance_eval do
  #     def model_name
  #       Event.model_name
  #     end
  #   end
  #   super
  # end  
end
