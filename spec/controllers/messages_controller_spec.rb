require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

	login_user
	describe "POST #create" do 
		let(:valid_params) { FactoryBot.build(:message) }
		it "saves a message with all the associated objects" do 
			allow(@message).to receive(:save).and_return(@message)
			post :create, params: valid_params
			expect(assigns[:message].chatroom).to eql()
		end
	end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #delete" do
  #   it "returns http success" do
  #     get :delete
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
