Rails.application.routes.draw do
  resources :appointments
  get :logged_in, to: "sessions#logged_in"
  delete :logout, to: "sessions#logout"
  resources :sessions, only: [:create]
  resources :registrations
  resources :appointments
  resources :events
  resources :mentors
  resources :bookings
  resources :contact_infos
  resources :event_registrations
  resources :users do 
    resources :bookings
    resources :event_registrations
    resources :appointments
  end
end
