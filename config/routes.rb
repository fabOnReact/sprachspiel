Rails.application.routes.draw do
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :messages, :items, :products, :purchases, :chatrooms, :events

	# resources :alliances, :controller => "events", :type => "Alliance"
	# resources :buildings, :controller => "events", :type => "Building"
	# resources :trades, :controller => "events", :type => "Trade"
	# resources :fights, :controller => "events", :type => "Fight"

	# ajax action to add items to form
	post "purchases/:product_id", to: "purchases#new", as: "add_item"

	# landing page
	post "subscription", to: 'buildings#createSubscription'

	mount ActionCable.server => '/cable'

	root to: "buildings#welcome"
end