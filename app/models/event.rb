class Event < ApplicationRecord
  TYPES = %w[Alliance Trade Fight Building]
  IMAGES = { "Alliance" => "manuscript", "Fight" => "helmet", "Building" => "castle", "Trade" => "money-bag" }
  has_and_belongs_to_many :users

  scope :alliances, -> { where(type: "Alliance") }

  def self.image
    IMAGES[self.to_s]
  end

  # def path
  #   url_for(controller: self.pluralize.downcase, action: 'new')
  # end
end
