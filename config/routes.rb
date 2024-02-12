Rails.application.routes.draw do
  root "pages#home"
  
  resources :articles
  get "signup", to: "users#new"
  get "signup", to: "users#create"
  resources :users, except: [:new, :create]
end
