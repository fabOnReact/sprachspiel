class Purchase < ApplicationRecord
	has_many :items, inverse_of: :purchase
	belongs_to :user
	
	accepts_nested_attributes_for :items
	validates :price, presence: true
  validates :price, numericality: { greater_than: 0}

	before_save :user_has_money
	after_save :update_balance

	scope :price_sum, ->(resource) { joins(:price).sum(resource) }

	def update_balance
		user.money -= self.price
    user.update_attribute(:money, user.money)
  end

	def user_has_money
	  errors.add(:price, "Price is too high!") if user.money < price
	end
end
