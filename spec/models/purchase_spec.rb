require 'rails_helper'

RSpec.describe Purchase, type: :model do

	let(:purchase) { purchase = FactoryGirl.create(:purchase)}
	subject { Purchase.new }

	it "should be an instance of Purchase" do 
		expect(subject).to be_an_instance_of(Purchase)
	end

	it "should create an object with the correct parameters" do 
		expect(purchase).to change(Purchase, :count).by(1)
	end

end
