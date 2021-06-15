Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Draft routes
  get 'draft', to: 'pages#draft'
  get 'draft2', to: 'pages#draft2'

  resources :after_sign_up, only: [:index, :new, :update]

  resources :after_sign_up, only: [:show] do
    resources :meetings, only: [ :create ]
    resources :advice_preferences, only: [ :new, :create ]
    resources :user_industries, only: [ :new, :create ]
  end


  resources :meetings, only: [:index]

  # Dashboard route
  get 'my_dashboard', to: 'dashboard#my_dashboard'

  # Advice Preference routes
  # resources :advice_preferences, only: [:new, :create]

end
