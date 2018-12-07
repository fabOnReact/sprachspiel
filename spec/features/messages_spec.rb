# require 'rails_helper'
# 
# Capybara.register_driver :selenium do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :firefox)
# end
# 
# describe "creating messages", type: :feature, js: true do 
#   let(:chatroom) { FactoryBot.build_stubbed(:chatroom) }
#   
#   before :each do
#     allow(Chatroom).to receive(:first).and_return(chatroom)
#   end
# 
#   after :each do 
#     Warden.test_reset!
#   end
# 
#   it 'post a message' do 
#     allow_any_instance_of(ApplicationHelper).to receive(:android_request).and_return(false)
#     user = FactoryBot.create(:user)
#     login_as(user, :scope => :user)
# 
#     visit '/purchases/new' 
#     fill_in 'message_content', with: 'test message \n'
#     find("#message_content").set("\n")
#     # save_and_open_page
#     binding.pry
#     expect(page).to have_content 'Success'
#   end
# end
