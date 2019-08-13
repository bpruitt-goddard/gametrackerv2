Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'user_sessions#new', as: 'login'
  get 'logout', to: 'user_sessions#destroy', as: 'logout'

  resources :users
  resources :players
  resources :games
  resources :sessions
  resources :user_sessions

  post 'copy_session_from', to: 'sessions#copy_from_existing', as: 'copy_session_from'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
