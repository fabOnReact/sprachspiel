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

  # describe 'creating_entries' do 
  #   it 'should create all the accounts' do
  #      expect(user.accounts.size).to eql(User::ACCOUNTS.size)
  #   end

  #   it 'should have the correct balance for every account' do
  #      balances = user.accounts.map {|account| account.balance.to_i }
  #      expect(balances).to match_array([100, 100, 100, 100, 100, 100, 600])
  #   end

  #   it 'should have accounting enties' do
  #      entry = user.accounts.find_by(name: "coins").entries.first
  #      expect(entry).to be_an_instance_of(Plutus::Entry)
  #   end
  # end

	describe '#name' do
		it 'splits the email and returns the email' do
			user = FactoryBot.create(:user, email: 'fabrizio@email.com')
			expect(user.name).to eql('fabrizio')
		end
	end

	# describe '#total_purchases' do
	# 	before(:each) { @user = FactoryBot.create(:user_with_purchases)}

	# 	it 'returns an array with the total purchases for that user' do
	# 		allow(Purchase).to receive(:price_sum).and_return(10)
	# 		expect(@user.total_purchases).to match_array([10,10,10,10,10])
	# 	end

	# 	it 'should return an array of 5 elements' do
	# 		expect(@user.total_purchases.class).to be(Array)
	# 	end
	# end

	# describe '#total_sales' do
	# 	before(:each) { @user = FactoryBot.create(:user_with_sales)}

	# 	it 'returns an array with the total purchases for that user' do			
	# 		allow(Sale).to receive(:price_sum).and_return(10)
	# 		expect(@user.total_sales).to match_array([10,10,10,10,10])
	# 	end

	# 	it 'should return an array of 5 elements' do			
	# 		expect(@user.total_sales.class).to be(Array)
	# 	end
	# end

	# describe '#current_balance' do
	# 	it 'returns an array with the current balance of that user' do
	# 		allow(user).to receive(:total_sales).and_return([20,10,10,20,10])
	# 		allow(user).to receive(:total_purchases).and_return([10,10,10,10,10])
	# 		expect(user.current_balance).to match_array([10,0,0,10,0])
	# 	end
	# end

	# describe '#ending_balance' do
	# 	it 'return an array with the ending balance for the user' do
	# 		allow(user).to receive(:current_balance).and_return([-30,-20,10,30,-10])
	# 		expect(user.ending_balance).to match_array([70,80,110,130,90])
	# 	end				
	# end

	# describe '#validation_balance' do
	# 	before(:each) do
	# 		allow(user).to receive(:ending_balance).and_return([90, 10, 10, 10, 10])
	# 	end

	# 	it 'return false if one of the amounts is too high' do
	# 		price = FactoryBot.create(:price, gold: 120)
	# 		allow(user).to receive(:ending_balance).and_return([90, 10, 10, 10, 10])
	# 		expect(user.validation_balance(price)).to be(false)
	# 	end

	# 	it 'return true if no amount is too high' do
	# 		price = Price.new(gold: 10, wood: 10, food: 10, stone: 10, metal: 10) 
	# 		expect(user.validation_balance(price)).to be(true)
	# 	end
	# end

 #   describe '#create_items' do
 #      it 'should return an instance of the Items created' do
 #         expect(user.create_items).to be_an_instance_of(Array)
 #      end

 #      it 'should create four items' do
 #         item_number = user.role.building.products.where(bonus: true).count * 2
 #         expect{user.create_items}.to change(Item, :count).by(item_number)
 #      end
 #   end

 #   describe '#descriptions' do 
 #      it 'should return the mocked result' do
 #         user = FactoryBot.create(:user)
 #         expect(user.title).to eql('Bauernhof')
 #         expect(user.text).to eql('an example of description for this building')
 #      end
 #   end
end
