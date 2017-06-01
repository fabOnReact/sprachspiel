Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  devise_for :users
  resources :rooms #, param: :slug
  resources :messages
  root to: "application#index"

end
