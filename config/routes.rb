Rails.application.routes.draw do
  
    root 'static_pages#home'
    resources :users
    resources :microposts
    
    get     'sessions/new'
    get     '/signup',  to: 'users#new'
    post    '/signup',  to: 'users#create'
    
    resources :microposts do
        member do
            get 'add'
        end
    end
    
    resources :users do
        member do
            get 'bookshow'
        end
    end
    
    
    get     '/login',   to: 'sessions#new'
    post    '/login',   to: 'sessions#create'
    delete  '/logout',  to: 'sessions#destroy'
    
    delete  '/users/:id/bookshow',  to: 'microposts#destroy'
    
    get '/ranking', to: 'book#show'
    
end