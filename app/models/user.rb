class User < ApplicationRecord
      # ASSETS = ["coins","gold", "wood", "wheat", "stone", "iron"]
      # EQUITY = ["equity"]
      # RESOURCES = ["gold", "wood", "food", "stone", "metal"]
      # STARTING_BALANCE = [100, 100, 100, 100, 100, 100]
      # STARTING_QUANTITIES = [100, 100, 100, 100, 100, 100]
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
      # belongs_to :chatroom 
      has_many :messages, :dependent => :destroy
      has_many :purchases, :dependent => :destroy
      has_many :items, through: :purchases
      has_and_belongs_to_many :events
      belongs_to :role
      belongs_to :event

      # scope :online, -> { where("updated_at > ?", 10.minutes.ago) }
      scope :guest, -> { where(email: "guest@email.com").first }
      scope :exclude, -> (user) { where.not(id: user) }
      # scope :products_count, -> { items.group(:product_id).count }
      # scope :count_items, -> (filter) { items.group(:product_id).count(filter) }
      # scope :count_used, -> { items.group(:product_id).count(:used) }
      # scope :count_sold, -> { items.group(:product_id).count(:sold) }

      validates :username, uniqueness: true
      validates :username, :role, presence: true

      # before_save :create_accounts
      # after_create :create_entries

      def self.participants(user)
         self.exclude(user).map {|user| user.username }.join(', ')
      end

      def count_items(filter = :id)
         items.group(:product).count(filter)
      end

      # splits the email and uses the part before the @ for the name
      def name 
         email.split('@')[0][0,8]
      end

      # defines a Proc, the variable add_array is passed as argument to the method 
      # Array#calculation to perform a specific arythmetic calculation
      # def add_array
      #    return Proc.new {|x, y| x + y }
      # end

      # def is_not_higher
      #    return Proc.new {|x, y| x >= y}
      # end
      
      # # calculates the ending balance after all purchases/sales
      # def ending_balance
      #    STARTING_BALANCE.calculation(add_array, current_balance)
      # end

      # # perform a validation to check if the user has money for the purchase/sale
      # def validation_balance(price)
      #    price_array = Array.new(RESOURCES.map {|resource| price[resource]})
      #    return ending_balance.compare(is_not_higher, price_array)
      # end

      # # get the total amounts of purchases for an user
      # def total_purchases
      #    # Query all invoices from purchases/sales for that user in a nested array
      #    RESOURCES.collect { |resource| self.purchases.price_sum(resource)}
      # end

      # # get the total amount of sales for an user
      # def total_sales
      #    # Query all invoices from purchases/sales for that user in a nested array
      #    RESOURCES.collect { |resource| self.sales.price_sum(resource)}
      # end

      # # defines a Proc, the variable substraction is passed as argument to the method 
      # # Array#calculation to perform a specific arythmetic calculation
      # def substract_array
      #    return Proc.new {|x, y| x - y }
      # end

      # # takes the totals sales and purchases arrays and returns an array of results
      # def current_balance
      #    total_sales.calculation(substract_array, total_purchases)
      # end

      # def clear_purchases(room_id)
      #    self.purchases.where(room_id: room_id, sale_id: nil, selfmade: nil).destroy_all
      # end

      # def room_owner(room)
      #    self == room.user
      # end

      def admin?
         self.admin == true
      end

      def online?
         updated_at > 10.minutes.ago
      end

      # def title
      #    descriptions.title
      # end

      # def text
      #    descriptions.text
      # end
end