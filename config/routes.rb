Rails.application.routes.draw do
  get '/health', to: 'health#health'
  resources :users, except: [:index, :update, :edit]
end
