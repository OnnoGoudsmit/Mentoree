Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Draft routes
  get 'draft', to: 'pages#draft'
  get 'draft2', to: 'pages#draft2'

  # Users = after_sign_up routes
  resources :after_sign_up, only: [:new, :update]
  resources :meetings, only: [:index]

  # Dashboard route
  get 'my_dashboard', to: 'dashboard#my_dashboard'

  # Advice Preference routes
  # resources :advice_preferences, only: [:new, :create]

  resources :after_sign_up do
    resources :advice_preferences, only: [ :new, :create ]
  end

end
