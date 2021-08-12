Rails.application.routes.draw do
  resources :sessions, only: [:create]
  get :logged_in, to: "sessions#logged_in"
  delete :logout, to: "sessions#logout"
  
  resources :users do 
    resources :mentors
  end

  
end
