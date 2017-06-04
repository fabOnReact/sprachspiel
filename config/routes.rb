Rails.application.routes.draw do

	mount ActionCable.server => '/cable'
	devise_for :users
	resources :messages

	resources :buildings do 
		resources :rooms
	end

	# landing page
	post "subscription", to: 'rooms#createSubscription'

	# rooms
	get "rooms/:id/delete", to: 'rooms#delete', as: 'delete_room'

	root to: "rooms#welcome"

end
