Rails.application.routes.draw do
  resources :event_registrations
  get :logged_in, to: "sessions#logged_in"
  delete :logout, to: "sessions#logout"
  resources :sessions, only: [:create]
  resources :events
  resources :mentors
  resources :bookings
  resources :attendances
  resources :contact_infos
  resources :users do 
    resources :bookings
    resources :attendances
  end
end
