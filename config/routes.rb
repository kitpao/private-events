Rails.application.routes.draw do
  get '/health', to: 'health#health'
  resources :users, except: %i[index update edit new]
  resources :sessions, only: %i[create destroy]
  get '/sign_in', to: 'sessions#new'
  get '/sign_up', to: 'users#new'
end
