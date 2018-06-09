require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:alliance) { FactoryBot.create(:alliance) }
  let(:valid_attributes) { FactoryBot.attributes_for(:alliance) }

  login_user
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "should http success" do
      get :new, params: {type: "Alliance"}
      expect(response).to have_http_status(200)
    end    
  end

  describe "POST #create" do
    it "should redirect" do
      post :create, params: {event: valid_attributes }
      expect(response).to have_http_status(302)
    end

    it "should create an instance of Event" do 
      post :create, params: {event: valid_attributes }
      expect(assigns[:event][:type]).to eql("Alliance")
    end

    it "should include current_user between users" do
      post :create, params: {event: valid_attributes}
      expect(Event.last.users).to include(controller.current_user)
    end

    it "should increate the Event.count by 1" do
      expect{post :create, params: {event: valid_attributes }}.to change(Event, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, params: {id: alliance, type: "Alliance"}      
      expect(response).to have_http_status(:success)
    end
  end
end