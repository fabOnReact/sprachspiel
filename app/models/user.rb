class User < ApplicationRecord
	# returns the list of resource available
	RESOURCES = ["gold", "wood", "food", "stone", "metal"]
	STARTING_BALANCE = [100, 100, 100, 100, 100]
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	      :recoverable, :rememberable, :trackable, :validatable
	has_many :rooms, :dependent => :destroy
	has_many :messages, :dependent => :destroy
	has_many :chatrooms, through: :messages 
	has_many :purchases, :dependent => :destroy
	has_many :sales, :dependent => :destroy
	belongs_to :role

	accepts_nested_attributes_for :rooms

	scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }

	validates :username, uniqueness: true
	validates :username, :role, presence: true

	# splits the email and uses the part before the @ for the name
	def name 
		email.split('@')[0]
	end

   # defines a Proc, the variable add_array is passed as argument to the method 
   # Array#calculation to perform a specific arythmetic calculation
   def add_array
      return Proc.new {|x, y| x + y }
   end

   def is_not_higher
      return Proc.new {|x, y| x >= y}
   end
	
   # calculates the ending balance after all purchases/sales
	def ending_balance
      STARTING_BALANCE.calculation(add_array, current_balance)
	end

	# perform a validation to check if the user has money for the purchase/sale
	def validation_balance(price)
		price_array = Array.new(RESOURCES.map {|resource| price[resource]})
      return ending_balance.compare(is_not_higher, price_array)
	end

	# get the total amounts of purchases for an user
	def total_purchases
		# Query all invoices from purchases/sales for that user in a nested array
		RESOURCES.collect { |resource| self.purchases.price_sum(resource)}
	end

	# get the total amount of sales for an user
	def total_sales
		# Query all invoices from purchases/sales for that user in a nested array
		RESOURCES.collect { |resource| self.sales.price_sum(resource)}
	end

   # defines a Proc, the variable substraction is passed as argument to the method 
   # Array#calculation to perform a specific arythmetic calculation
   def substract_array
      return Proc.new {|x, y| x - y }
   end

	# takes the totals sales and purchases arrays and returns an array of results
	def current_balance
      total_sales.calculation(substract_array, total_purchases)
	end

	def user_has_room(building)
		if self.admin 
			return false
		elsif building.id == 4 
			return true
		else
			return self.present? && self.rooms.present? 
		end
	end

  def clear_purchases(room_id)
    self.purchases.where(room_id: room_id, sale_id: nil, selfmade: nil).destroy_all
  end

  def room_owner(room)
    self == room.user
  end

  def admin?
    self.admin == true
  end

  def online?
    updated_at > 10.minutes.ago
  end
end
