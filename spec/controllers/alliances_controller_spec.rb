require 'rails_helper'

RSpec.describe AlliancesController, type: :controller do
	login_user
	describe "update" do
		it "adds the current_user to the alliance" do 
			alliance = double("alliance", :id => 1, :users => [])
			allow(Alliance).to receive(:find).and_return(alliance)
			allow(alliance).to receive(:save)
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
