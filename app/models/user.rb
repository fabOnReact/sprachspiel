class User < ApplicationRecord
      ASSETS = ["coins","gold", "wood", "wheat", "stone", "iron"]
      EQUITY = ["equity"]
      RESOURCES = ["gold", "wood", "food", "stone", "metal"]
      STARTING_BALANCE = [100, 100, 100, 100, 100, 100]
      STARTING_QUANTITIES = [100, 100, 100, 100, 100, 100]
      # Include default devise modules. Others available are:
      # :confirmable, :lockable, :timeoutable and :omniauthable
      devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
      # belongs_to :chatroom 
      has_many :messages, :dependent => :destroy
      has_many :purchases, :dependent => :destroy
      has_many :items, through: :purchases
      has_many :events, as: :actions
      has_many :fights, through: :events, source: :action, source_type: 'Fight' 
      has_many :buildings, through: :events, source: :action, source_type: 'Building' 
      has_many :alliances, through: :events, source: :action, source_type: 'Alliance' 
      has_many :trades, through: :events, source: :action, source_type: 'Trade' 
      belongs_to :role

      # scope :online, -> { where("updated_at > ?", 10.minutes.ago) }
      scope :guest, -> { where(email: "guest@email.com").first }
      # scope :products_count, -> { items.group(:product_id).count }
      # scope :count_items, -> (filter) { items.group(:product_id).count(filter) }
      # scope :count_used, -> { items.group(:product_id).count(:used) }
      # scope :count_sold, -> { items.group(:product_id).count(:sold) }

      validates :username, uniqueness: true
      validates :username, :role, presence: true

      # before_save :create_accounts
      # after_create :create_entries

      # def create_room
      #    @room = Room.new(title: title, description: text, building_id: self.role.building.id, user_id: self.id)        
      # end  

      def count_items(filter = :id)
         items.group(:product).count(filter)
      end

      def total_amount
         # total amount of starting resources for us
         STARTING_BALANCE.inject(0, :+)
      end

      def equity_id
         self.accounts.equity.id
      end

      # def create_entries
      #    # Every new user will have a starting amount for every account   
      #    # I will Set them with Equity and an equal amount of Assets       
      #    # registering the entries
      #    entry = Plutus::Entry.new(:description => "User Creation - Initial Balance", :date => Date.today)
         
      #    # debiting of multiple assets accounts ["coins","gold", "wood", "wheat", "stone", "iron"]
      #    self.accounts.assets.map.with_index do |asset, index|
      #       entry.debit_amounts << Plutus::DebitAmount.new(:account_id => asset.id, :amount => STARTING_BALANCE[index], :quantity => STARTING_QUANTITIES[index])
      #    end

      #    # crediting of one equity account
      #    entry.credit_amounts << Plutus::CreditAmount.new(:account_id => equity_id, :amount => total_amount)
      #    entry.save
         
      #    # self.role.building.products.where(bonus: true).each do |product|
      #    #    2.times do 
      #    #       @item = Item.create(sold: false, used: false, selfmade: true, product: product, user: self)
      #    #    end
      #    # end  
      #    # sale = Sale.create(purchase_id: @purchase.id, room_id: self.id, price_id: self.price.id, user_id: self.user.id)    
      #    # sale.purchase.items.each do |item| 
      #       # item.update_attributes(room_id: purchase.room_id)
      #    # end
      # end     


      # splits the email and uses the part before the @ for the name
      def name 
         email.split('@')[0][0,8]
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

      # def user_has_room(building)
      #    if self.admin 
      #       return false
      #    elsif building.id == 4 
      #       return true
      #    else
      #       return self.present? && self.rooms.present? 
      #    end
      # end

      def clear_purchases(room_id)
         self.purchases.where(room_id: room_id, sale_id: nil, selfmade: nil).destroy_all
      end

      # def room_owner(room)
      #    self == room.user
      # end

      def admin?
         self.admin == true
      end

      def online?
         updated_at > 10.minutes.ago
      end

      def descriptions
         self.role.building.descriptions
      end

      def title
         descriptions.title
      end

      def text
         descriptions.text
      end
end