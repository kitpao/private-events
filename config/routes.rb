Rails.application.routes.draw do
  get '/health', to: 'health#health'
  resources :user , except: [:index, :update, :edit]
end
