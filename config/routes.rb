Rails.application.routes.draw do
	
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :messages, :items, :prices

	resources :buildings do 
		resources :rooms
		resources :chatrooms
	end

	resources :rooms do
		resources :purchases
		resources :sales
		resources :chatrooms
	end

	# landing page
	post "subscription", to: 'buildings#createSubscription'

	# rooms
	get "/buildings/:building_id/rooms/:id/delete", to: 'rooms#delete', as: 'delete_room'
	# purchase
	get "/rooms/:room_id/purchases/:id/delete", to: 'purchases#delete', as: 'delete_room_purchase'
	# sale
	post "/rooms/:room_id/sales/:purchase_id", to: 'sales#create', as: 'create_room_sale'
	# building room product price calculation
	get "/rooms/:id/products/:product_id", to: 'rooms#product', as: 'room_product'

	mount ActionCable.server => '/cable'

	root to: "buildings#welcome"

end
