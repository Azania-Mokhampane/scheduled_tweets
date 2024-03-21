Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "about", to: "about#index"

  get "passwords", to: "passwords#edit", as: :edit_password
  patch "passwords", to: "passwords#update"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"

  get "auth/twitter2/callback", to: "omniauth_callbacks#twitter2" 
  # Defines a route that maps HTTP GET requests to the path /auth/twitter2/callback to the OmniauthCallbacksController action twitter2
  
   
  resources :twitter_accounts

  root to: "main#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
