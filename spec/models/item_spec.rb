require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) {FactoryBot.create(:item)}
  let(:ironsword) {FactoryBot.create(:ironsword)}

  describe "#prop_amount" do
    it "should return the amount" do 
      amount = item.product.property.amount
      expect(item.prop_amount).to be(amount)
    end
  end

  describe "#prop_name" do 
    it "should return the property accessors" do 
      expect(ironsword.prop_name).to be(:attack)
    end
  end

  describe "#update_user" do 
    it "should update the user property with the correct amount" do
      expect_any_instance_of(Item).to receive(:prop_amount).and_return(20)
      expect(ironsword.user.attack).to be(120)
    end
  end
end
