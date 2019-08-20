require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { FactoryBot.create(:event) }
  let(:valid_attributes) { FactoryBot.attributes_for(:event)}
	let(:valid_params) { FactoryBot.attributes_for(:event) }

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
		let(:event) { FactoryBot.build(:event, id: 1)}
		before do 	
			allow(Event).to receive(:new).and_return(event)
		end

		it "redirects to the show page" do 
			allow(event).to receive(:save).and_return(true)
			post :create, params: {event: valid_params}
			expect(response).to redirect_to "/events"
		end

		it 'renders the index view' do 
			allow(event).to receive(:save).and_return(false)
			post :create, params: {event: valid_params}
			expect(response).to render_template :index
		end

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
      get :edit, params: {id: event, type: "Event"}      
      expect(response).to have_http_status(:success)
    end
	end

	describe "PUT #update" do
		it "adds the current user" do 
			event = double("event", :id => 1, :users => [])
			allow(Event).to receive(:find).and_return(event)
			allow(event).to receive(:save).and_return(true)
			patch :update, params: { id: 1 }
			expect(event.users.size).to be(1)
		end 
	end

	context '#private' do 
		describe "create_event" do 
			it "create an instance with the correct values" do
				allow(controller).to receive(:event_params).and_return(valid_params)
				expect(Event).to receive(:new).with(valid_params).and_return(event)
				controller.send(:create_event)
				expect(assigns[:event]).to be(event)
			end
		end

		describe "update_user" do 
			it "should add the current user" do
				controller.instance_variable_set(:@event, event) 
				expect { controller.send(:update_user) }.to change(event.users, :count).by(1)
			end
		end 

	#	describe 'user_included?' do 
	#		it 'should return true if user is present' do
	#			event = double("event", :id => 1, :users => [current_user])
	#			expect 


	end
end
