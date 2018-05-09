require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  let(:product) { FactoryBot.create(:product) }
  let(:purchase) { FactoryBot.build(:purchase_with_items)}
  let(:item1) { FactoryBot.build(:item) }
  let(:item2) { FactoryBot.build(:item) }
  let(:item3) { FactoryBot.build(:item) }
  let(:chatroom) { FactoryBot.create(:chatroom) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before(:each) { chatroom }
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
    before(:each) { chatroom }
    let(:params) { { "purchase" => { "price" => purchase.price, "items_attributes" => { "0" => { product_id: product.id }, "1" => { product_id: product.id }, "3" => { product_id: product.id }}}} }

    context 'user authenticated' do
      login_user      
      
      it 'returns http success' do
        expect { post :create, params: params }.to change{ Purchase.count }.by(1)
      end

      it 'return a notice if successfull' do
        post :create, params: params
        flash_hash = json_response[:responseJSON][:notice]
        expect(flash_hash).to eql(["Your purchase was saved"])
      end

      it 'returns the errors if failed' do 
        params = { "purchase" => { "items_attributes" => { "0" => { product_id: product.id }, "1" => { product_id: product.id }, "3" => { product_id: product.id }}}} 
        post :create, params: params
        errors = json_response[:responseJSON][:error]
        expect(errors).to eql(["Price can't be blank"])
      end
    end

    context 'user not authenticated' do
      it 'returns an authentication error message' do
        post :create, params: params 
        expect(response).to have_http_status(302)
      end
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
