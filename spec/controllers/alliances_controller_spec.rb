require 'rails_helper'

RSpec.describe AlliancesController, type: :controller do
  let(:alliance) { double("alliance", :id => 1, :users => [])}
  let(:valid_params) { FactoryBot.attributes_for(:alliance) }
  login_user
  describe "create_alliance" do 
    it "create an instance with the correct values" do
        allow(controller).to receive(:alliance_params).and_return(valid_params)
        expect(Alliance).to receive(:new).with(valid_params).and_return(alliance)
        controller.send(:create_alliance)
        expect(assigns[:alliance]).to be(alliance)
    end
  end
                          
  describe "add_user" do 
      it "should add the current user" do
          controller.instance_variable_set(:@alliance, alliance) 
          expect { controller.send(:add_user) }.to change(alliance.users, :count).by(1)
      end
  end 

  describe "create" do 
      let(:alliance) { FactoryBot.build(:alliance, id: 1)}
      before do 	
          allow(Alliance).to receive(:new).and_return(alliance)
      end

      it "redirects to the show page" do 
          allow(alliance).to receive(:save).and_return(true)
          post :create, params: {alliance: valid_params}
          expect(response).to redirect_to "/alliances/1"
      end

      it 'renders the index view' do 
          allow(alliance).to receive(:save).and_return(false)
          post :create, params: {alliance: valid_params}
          expect(response).to render_template :index
      end
  end
              
  describe "update" do
      it "adds the current user" do 
          alliance = double("alliance", :id => 1, :users => [])
          allow(Alliance).to receive(:find).and_return(alliance)
          allow(alliance).to receive(:save).and_return(true)
          patch :update, params: { id: 1 }
          expect(alliance.users.size).to be(1)
      end 
  end

  describe "show" do 
    let(:alliance) { double("alliance", :id => 1) }
    before(:each) do
          expect(Alliance).to receive(:find).with("1").and_return(alliance)
      end

      it "show the alliance home page" do 
          get :show, params: { id: alliance.id}
      end

      it "renders the show template" do 
          get :show, params: { id: alliance.id}
          expect(subject).to render_template(:show)
      end
  end
end
