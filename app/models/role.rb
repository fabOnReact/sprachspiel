class Role < ApplicationRecord
	has_many :users
	has_one :building
end
