Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  devise_for :users
  resources :rooms, :messages
  root to: "rooms#index"

end
