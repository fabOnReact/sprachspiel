require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:alliance) { FactoryBot.create(:alliance) }

  login_user
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: {type: "Alliance"}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: alliance, type: "Alliance"}      
      expect(response).to have_http_status(:success)
    end
  end
end
