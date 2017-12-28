require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { FactoryBot.create(:user)}	

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

	describe '#name' do
		it 'splits the email and returns the email' do
			user = FactoryBot.create(:user, email: 'fabrizio@email.com')
			expect(user.name).to eql('fabrizio')
		end
	end

	describe '#total_purchases' do
		before(:each) { @user = FactoryBot.create(:user_with_purchases)}

		it 'returns an array with the total purchases for that user' do
			allow(Purchase).to receive(:price_sum).and_return(10)
			expect(@user.total_purchases).to match_array([10,10,10,10,10])
		end

		it 'should return an array of 5 elements' do
			expect(@user.total_purchases.class).to be(Array)
		end
	end

	describe '#total_sales' do
		before(:each) { @user = FactoryBot.create(:user_with_sales)}

		it 'returns an array with the total purchases for that user' do			
			allow(Sale).to receive(:price_sum).and_return(10)
			expect(@user.total_sales).to match_array([10,10,10,10,10])
		end

		it 'should return an array of 5 elements' do			
			expect(@user.total_sales.class).to be(Array)
		end
	end

	describe '#current_balance' do
		it 'returns an array with the current balance of that user' do
			allow(user).to receive(:total_sales).and_return([20,10,10,20,10])
			allow(user).to receive(:total_purchases).and_return([10,10,10,10,10])
			expect(user.current_balance).to match_array([10,0,0,10,0])
		end
	end

	describe '#ending_balance' do
		it 'return an array with the ending balance for the user' do
			allow(user).to receive(:current_balance).and_return([-30,-20,10,30,-10])
			expect(user.ending_balance).to match_array([70,80,110,130,90])
		end				
	end

	describe '#validation_balance' do
		before(:each) do
			allow(user).to receive(:ending_balance).and_return([90, 10, 10, 10, 10])
		end

		it 'return false if one of the amounts is too high' do
			price = FactoryBot.create(:price, gold: 120)
			allow(user).to receive(:ending_balance).and_return([90, 10, 10, 10, 10])
			expect(user.validation_balance(price)).to be(false)
		end

		it 'return true if no amount is too high' do
			price = Price.new(gold: 10, wood: 10, food: 10, stone: 10, metal: 10) 
			expect(user.validation_balance(price)).to be(true)
		end
	end
end
