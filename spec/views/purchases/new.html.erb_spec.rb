require 'rails_helper'

RSpec.describe "purchases/new.html.erb", type: :view do
  it 'renders the view' do
    allow(view).to receive(:user_signed_in?).and_return(false)
    assign(:purchase, FactoryBot.build_stubbed(:purchase) )
    assign(:products, [FactoryBot.build_stubbed(:product)])
    assign(:chatroom, FactoryBot.build_stubbed(:chatroom))
    assign(:message, FactoryBot.build_stubbed(:message))
    render
    expect(rendered).to match "assets/coins"
  end
end
