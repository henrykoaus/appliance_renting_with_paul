Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  get 'offer_lists/index'
  resources :favourites, only: [:create, :destroy]
  resources :favourite_lists, only: [:index]
  resources :appliances do
    resources :reviews
  end
  resources :reviews, only: [ :destroy, :index ]
  resources :offers, only: [ :index, :show, :destroy ]
  resources :reviews, only: [:destroy]
  resources :offers, only: [:create, :destroy]
  resources :offer_lists, only: [:index]
  resources :bookings, only: [:create, :destroy]
  resources :booking_lists, only: [:index]

  devise_for :users
  resource :profile, only: [:show, :edit, :update]  # Singular resource for user's own profile

  root to: "appliances#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
