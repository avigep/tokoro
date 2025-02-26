Rails.application.routes.draw do
  resources :members, only: [:index, :show]
  resources :places
  devise_for :users

  root to: 'places#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
