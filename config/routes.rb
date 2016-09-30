Rails.application.routes.draw do
  root "teachers#home"
  resources :teachers
  get "/signup", to: "teachers#new"
end
