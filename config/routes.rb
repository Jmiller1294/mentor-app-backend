Rails.application.routes.draw do
  get :logged_in, to: "sessions#logged_in"
  delete :logout, to: "sessions#logout"
  resources :sessions, only: [:create]
  resources :events
  resources :mentors
  resources :bookings
  resources :contact_infos
  resources :users do 
    resources :bookings
    resources :event_registrations
  end
end
