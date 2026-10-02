Rails.application.routes.draw do
  get "friend_requests/index"
  # get "friend_requests/show"
  # get "friend_requests/new"
  # get "friend_requests/create"
  # get "friend_requests/destroy"
  # get "friend_requests/accept"
  # get "posts/new"
  # get "posts/create"
  # get "posts/update"
  # get "posts/edit"
  # get "posts/destroy"
  # get "posts/index"
  # get "posts/show"
  get "homes/index"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :users
  resources :homes
  resources :posts
  resources :friend_requests do |request|
    member do
      post "accept"
      post "decline"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "homes#index"
end
