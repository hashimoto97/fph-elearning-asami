Rails.application.routes.draw do
  root 'home#index'
  get '/signup' ,to: 'users#new'
  get '/login' ,to: 'sessions#new'
  post '/login' ,to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  get '/categories',to: 'categories#index'
  get '/answers/new',to: 'answers#new'
  resources :users,except: :new
  resources :lessons

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
