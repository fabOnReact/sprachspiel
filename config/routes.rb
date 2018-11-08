Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'users/registrations'}
	
  resources :messages, :items, :products, :purchases, :chatrooms, :events, :invites
  resources :alliances #, :controller => "events", :type => "Alliance"
  resources :trades, :controller => "events", :type => "Trade"
  resources :fights, :controller => "events", :type => "Fight"
  resources :buildings, :controller => "events", :type => "Building"  
  # get "alliances", to: "alliances#index"
  resource :subscriptions, only: [:new, :create]
  # ajax action to add items to form
  post "purchases/:product_id", to: "purchases#new", as: "add_item"
  mount ActionCable.server => '/cable'
  root to: "subscriptions#new"
end
