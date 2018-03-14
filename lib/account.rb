class Plutus::Account < ActiveRecord::Base
   class_attribute :normal_credit_balance
   scope :equity, -> { find_by(name: "equity") }
   scope :asset, -> { where(type: "Plutus::Asset")}
end