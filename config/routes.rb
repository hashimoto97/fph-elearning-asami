Rails.application.routes.draw do
  root 'home#index'
  get '/signup' ,to: 'users#new'
  get '/login' ,to: 'sessions#new'
  post '/login' ,to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :users,except: :new

  resources :users do
    member do
      get :following,:followers
    end
  end

  namespace :admin do
    resources :categories do 
      resources :words
    end
  end

  resources :relationships,only:[:create,:destroy]

end
