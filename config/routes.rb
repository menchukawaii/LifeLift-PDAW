Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index", as: :home

  get "my-account", to: "inscriptions#my_account", as: :my_account
  get "my-account/:rutine", to: "inscriptions#view_rutine", as: :view_rutine
  post "my-account/:set/done", to: "inscriptions#done_rutine_set", as: :done_rutine_set
  resources :inscriptions, only: [:new, :create, :edit, :update]

  namespace :trainer do
    get "my-account", to: "trainers#my_account", as: :my_account
    get "my-account/:user", to: "trainers#user", as: :user
    resources :rutines
    resources :rutine_sets, only: [:create, :destroy]
  end

  # Rutas Admin
  namespace :admin do
    resources :exercises
    resources :users
  end
end
