class Fight < ApplicationRecord
  has_many :events, as: :actions
  has_many :users, through: :events, source: :action, source_type: 'User' 
  def self.image
    :helmet
  end    
end
