Rails.application.routes.draw do
  resources :mentors
  resources :users
  resources :sessions, only: [:create]
  get :logged_in, to: "sessions#logged_in"
end
