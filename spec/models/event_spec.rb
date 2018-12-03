require 'rails_helper'

RSpec.describe Event, type: :model do  
  let(:user1) { FactoryBot.build_stubbed(:user) }
  let(:user2) { FactoryBot.build_stubbed(:user) }
  let(:event) { FactoryBot.build_stubbed(:event, users: [user1]) }

  describe "#icon" do 
    it "return the minus or add icon correctly" do
      expect(event.icon(user1)).to eql("minus")
      expect(event.icon(user2)).to eql("add")
    end

    it 'verify the user is included' do 
      expect(event.users.include? user1).to be true
      expect(event.users.include? user2).to be false
    end
  end
end
