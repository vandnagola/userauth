Rails.application.routes.draw do
  root "pages#home"
  
  resources :articles do
    member do 
      get :download
    end
  end
  get "signup", to: "users#new"
  post "signup", to: "users#create"

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  
  resources :users, except: [:new, :create]
end
