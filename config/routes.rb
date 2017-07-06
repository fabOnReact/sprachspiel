Rails.application.routes.draw do
	
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :messages, :items

	resources :buildings do 
		resources :rooms
		resources :chatrooms
	end

	resources :rooms do
		resources :prices do
			resources :purchases
		end			
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
	post "/rooms/:room_id/purchases/:id", to: 'purchases#sold', as: 'sold_room_purchase'
	# sale
	post "/rooms/:room_id/sales/:purchase_id", to: 'sales#create', as: 'create_room_sale'
	# price create_purchase
	
	# building room product price calculation
	post "rooms/:room_id/prices/:id/plus", to: 'prices#plus', as: 'room_price_plus'
	post "rooms/:room_id/prices/:id/minus", to: 'prices#minus', as: 'room_price_minus'

	mount ActionCable.server => '/cable'

	root to: "buildings#welcome"

end
