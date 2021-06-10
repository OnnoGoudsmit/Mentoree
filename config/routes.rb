Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'draft', to: 'pages#draft'
  get 'draft2', to: 'pages#draft2'

  resources :after_sign_up, only: [:new, :update]
  resources :users, only: [:edit, :update]
  resources :meetings, only: [:index]
end
