Rails.application.routes.draw do
	
  get 'products/show'

	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :messages, :items

	resources :buildings do 
		resources :rooms
		resources :chatrooms
	end

	resources :rooms do
		resource :prices do
			resources :purchases
		end
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
	post "/prices/:id/plus", to: 'prices#plus', as: 'price_plus'
	post "/prices/:id/minus", to: 'prices#minus', as: 'price_minus'

	mount ActionCable.server => '/cable'

	root to: "buildings#welcome"

end
