class Event < ApplicationRecord
  TYPES = %w[Alliance Trade Fight Building]
  CATEGORIES = {Alliance: :Waffen, Trade: [:Werkzeuge, :Lebensmittel]}
  BONUS = {Alliance: [[:Angriff, 20],[:Verteidigung, 10]], Trade: [[:Geld, 30],[:Energie, 20]], Fight: [], Building:[]}  
  ICONS = {edit: ['pencil', :get], destroy: ['garbage', :delete], update: ['check', :put]}
  EVENTS_HEADERS = %w[Participants Bonus Options]
  INVENTORIES_HEADERS = %w[Product N Bonus]   
  # IMAGES = { "Alliance" => "manuscript", "Fight" => "helmet", "Building" => "castle", "Trade" => "money-bag" }
  has_and_belongs_to_many :users
  has_many :items
  has_many :properties
  has_one :category
  validates :name, :description, presence: true

  TYPES.each do |type|
    scope type.downcase, -> { where(type: type) }
  end

  def self.image
    IMAGES[self.to_s]
  end

  def bonus
    BONUS[type.to_sym]
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
