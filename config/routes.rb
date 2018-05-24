Rails.application.routes.draw do
	devise_for :users, controllers: {registrations: 'users/registrations'}

  get '/alliances', to: 'events#index'
	resources :messages, :items, :products, :purchases, :chatrooms, :events, :alliances
	resource :subscriptions, only: [:new, :create]
	# ajax action to add items to form
	post "purchases/:product_id", to: "purchases#new", as: "add_item"
	# post "subscription", to: 'buildings#createSubscription'
	mount ActionCable.server => '/cable'
	root to: "subscriptions#new"
end