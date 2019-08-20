class Property < ApplicationRecord
  NAMES = %w[Angriff Verteidigung Energie Gesundheit Geld]
  ACCESSORS = {Angriff: :attack, Verteidigung: :defence, Energie: :energy, Gesundheit: :health, Geld: :money}
  # belongs_to :event
  validates :name, inclusion: { in: NAMES, message: "%{value} is not a valid name" }
  validates :amount, uniqueness: { scope: :name }
end
