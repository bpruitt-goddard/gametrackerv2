Rails.application.routes.draw do
  resources :players
  resources :games
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
