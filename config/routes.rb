Rails.application.routes.draw do
  get 'sessions/new'

  root "teachers#home"
  resources :teachers

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/signup", to: "teachers#new"
end
