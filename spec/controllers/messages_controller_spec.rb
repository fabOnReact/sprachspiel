require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  login_user
  describe "POST #create" do 
    let(:valid_params) { FactoryBot.build(:message) }
    let(:message) { FactoryBot.build_stubbed(:message) }
    it "saves a message with all the associated objects" 
  end
end
