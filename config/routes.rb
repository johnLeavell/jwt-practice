Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :balloons, only: [:create, :index]

  post "login", to: "auth#login"


end
