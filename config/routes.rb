Rails.application.routes.draw do
  
    root 'static_pages#home'
    resources :users
    
    get     'sessions/new'
    get     '/signup',  to: 'users#new'
    post    '/signup',  to: 'users#create'

    
    resources :users do
        member do
            get 'add'
        end
    end
    
    get     '/login',   to: 'sessions#new'
    post    '/login',   to: 'sessions#create'
    delete  '/logout',  to: 'sessions#destroy'
    
    get '/ranking', to: 'book#show'
    
    
end
