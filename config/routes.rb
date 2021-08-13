Rails.application.routes.draw do
  resources :events
  resources :sessions, only: [:create]
  get :logged_in, to: "sessions#logged_in"
  delete :logout, to: "sessions#logout"
  
  resources :mentors
  resources :bookings
  resources :users do 
    resources :bookings
  end

  

  
end
