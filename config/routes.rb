Rails.application.routes.draw do
	
	devise_for :users, controllers: {
		registrations: 'users/registrations'
	}

	resources :messages, :items, :purchase

	resources :buildings do 
		resources :rooms
	end

	# landing page
	post "subscription", to: 'rooms#createSubscription'

	# rooms
	get "/buildings/:building_id/rooms/:id/delete", to: 'rooms#delete', as: 'delete_room'

	mount ActionCable.server => '/cable'

	root to: "buildings#welcome"

end
