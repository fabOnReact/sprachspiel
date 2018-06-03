class User < ApplicationRecord
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

      # scope :online, -> { where("updated_at > ?", 10.minutes.ago) }
      scope :guest, -> { where(email: "guest@email.com").first }
      scope :exclude, -> (user) { where.not(id: user) }
      # scope :products_count, -> { items.group(:product_id).count }
      # scope :count_items, -> (filter) { items.group(:product_id).count(filter) }
      # scope :count_used, -> { items.group(:product_id).count(:used) }
      # scope :count_sold, -> { items.group(:product_id).count(:sold) }

      validates :username, uniqueness: true
      validates :username, :role, presence: true

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

      def admin?
         self.admin == true
      end

      def online?
         updated_at > 10.minutes.ago
      end
end