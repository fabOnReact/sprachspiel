require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let(:product) { FactoryBot.create(:product) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "finds the product if product_id is passed" do
      get :new, params: { product: product }
      expect(assigns["products"].first).to be_an_instance_of(Product)
    end

    it "responds with javascript" do
      get :new, xhr: true, params: { product: product }
      expect(response.header["Content-Type"]).to eq("text/javascript; charset=utf-8")
    end    
  end

  describe "POST #create" do
    it 'returns http success' do
      # post :create, params: 
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
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
