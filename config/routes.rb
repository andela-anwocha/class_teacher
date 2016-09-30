Rails.application.routes.draw do
  get "sessions/new"

  root "teachers#home"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"

  resources :teachers, only: [:new, :create]
  resources :teacher_classes, except: [:destroy] do
    resources :students, only: [:index, :new, :create]
  end

  get "/signup", to: "teachers#new"
end
