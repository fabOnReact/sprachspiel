require 'rails_helper'

RSpec.describe Purchase, type: :model do

	let(:purchase) { purchase = FactoryBot.create(:purchase)}
	subject { Purchase.new }

	it "should be an instance of Purchase" do 
		expect(subject).to be_an_instance_of(Purchase)
	end

	it "should create an object with the correct parameters" do 
		expect(purchase).to change(Purchase, :count).by(1)
	end

	# describe '#user_has_money' do
	# 	it 'returns an error if the user balance is not enough' do
	# 		allow(purchase.user).to receive(:validation_balance).and_return(false)
	# 		purchase.user_has_money
	# 		expect(purchase.errors[:price][0]).to eql('Price is too high!')
	# 	end

	# 	it 'returns no error if the user balance is sufficient' do
	# 		allow(purchase.user).to receive(:validation_balance).and_return(true)
	# 		purchase.user_has_money
	# 		expect(purchase.errors[:price]).to be_empty
	# 	end
	# end
end
