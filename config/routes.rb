Rails.application.routes.draw do
  
  resources :users do
    resources :deeds do
    end
  end

  root 'pages#homepage'

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback' => 'sessions#create'
  post 'auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  post 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy'
  post 'signout' => 'sessions#destroy'

  namespace :api do
    resources :users
  end
end
