require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
  	it { have_many :rooms}
  	it { have_many :messages}
  	it { have_many :chatrooms}
  	it { have_many :purchases}
  	it { have_many :sales}
  	it { should belong_to(:role)}
  	it { accept_nested_attributes_for :rooms}
  	it { validate_uniqueness_of :username}
  	it { validate_presence_of :username}
  	it { validate_presence_of :role}
  end
end
