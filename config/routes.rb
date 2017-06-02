Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  devise_for :users
  resources :rooms, :messages

  # landing page
  post "subscription", to: 'rooms#createSubscription'

  root to: "rooms#welcome"

end
