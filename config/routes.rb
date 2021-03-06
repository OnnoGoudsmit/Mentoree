Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Draft routes
  get 'draft', to: 'pages#draft'
  get 'draft2', to: 'pages#draft2'

  resources :after_sign_up, only: [:index, :new, :update]

  resources :after_sign_up, only: [:show] do
    resources :advice_preferences, only: [ :new, :create ]
    resources :user_industries, only: [ :new, :create ]
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :meetings, only: [:index, :create, :edit, :update] do
    resources :reviews, only: [ :new, :create ]
  end
  resources :reviews, only: [ :destroy ]


  # Dashboard route
  get 'my_dashboard', to: 'dashboard#my_dashboard'
  get '/user' => "dashboard#my_dashboard", :as => :user_root

  # Advice Preference routes
  # resources :advice_preferences, only: [:new, :create]
end
