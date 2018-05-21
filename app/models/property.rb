class Property < ApplicationRecord
  NAMES = %w[Angriff Verteidigung Energie Gesundheit]

  validates :name, inclusion: { in: NAMES,
    message: "%{value} is not a valid name" }
end
