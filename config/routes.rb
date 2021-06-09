Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'user/:id', to: 'user#show'
  get 'user/:id/edit', to: 'user#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'draft', to: 'pages#draft'
  get 'draft2', to: 'pages#draft2'


  resources :meetings, only: [:index]
end
