Rails.application.routes.draw do
  root 'welcome#index'

  # New Login session
  get 'sessions/new'

  # New User creation 
  get 'users/new'

  post 'log_out' => "sessions#destroy", :as => "log_out"
  get 'log_in' => "sessions#new", :as => "log_in"
  get 'sign_up' => "users#new", :as => "sign_up"
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
