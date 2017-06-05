class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rooms, :dependent => :destroy
  has_many :messages, :dependent => :destroy
  has_many :chatrooms, through: :messages 
  has_many :items, :dependent => :destroy        

  def name 
  	email.split('@')[0]
  end

  def startingBalance
    startingBalance = [100, 100, 100, 100, 100]
  end

end
