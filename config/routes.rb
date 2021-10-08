Rails.application.routes.draw do
  namespace :admin do
    resources :appointments
    resources :contact_infos
    resources :bookings
    resources :event_registrations
    resources :mentors
    resources :events
    resources :users
    root to: "users#index"
  end
  resources :appointments
  get :logged_in, to: "sessions#logged_in"
  delete :logout, to: "sessions#logout"
  delete '/favorites/:id' => 'users#delete_favorite_id'
  post '/favorites' => 'users#add_favorite_id'
  post 'rails/active_storage/direct_uploads', to: 'direct_uploads#create'
  resources :sessions, only: [:create]
  resources :registrations
  resources :appointments
  resources :events
  resources :mentors
  resources :bookings
  resources :contact_infos
  resources :event_registrations
  resources :users do 
    get "/favorites", to: "users#get_favorites"
    resources :bookings
    resources :event_registrations
    resources :appointments
  end
  root 'welcome#index'
end
