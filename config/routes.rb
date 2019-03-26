Rails.application.routes.draw do
  resources :users
  resources :players
  resources :games
  resources :sessions
  resources :user_sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
