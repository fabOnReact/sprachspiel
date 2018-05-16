class Event < ApplicationRecord
  TYPES = %w[Alliance Trade Fight Building]
  belongs_to :user
  belongs_to :fight
  belongs_to :building
  belongs_to :alliance
  belongs_to :trade
end
