Rails.application.routes.draw do
  
  get 'users/show'
  resources :reviews
  resources :users
  # post '/makeadeal', to: 'posts#createDeal'
  resources :posts do
    resources :comments
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'static_pages/home'
  get 'static_pages/account', to: 'static_pages#account', as: 'my_account'
  get '/search', to: 'posts#search', as: 'search'
  devise_for :users do
    resources :posts
    resources :deals 
    resources :reviews
  end

  # devise_for :users, :skip => [:registrations] 
  # as :user do
  #   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'    
  #   patch 'users' => 'devise/registrations#update', :as => 'user_registration'            
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  post 'deals/create', to: 'deals#create'
  get 'deals/:id', to: 'deals#show'
  get 'deals', to: 'deals#index', as: 'deals'
  get 'posts/:id', to: 'post#show'
  # get 'deals/:deal_id/reviews/reviews', to: 'reviews#new'
  get '/deals/:deal_id/reviews/new', to: 'reviews#new', as: 'add_reviews'
  get 'users/:user_id/posts', to: 'posts#myposts', as: 'myposts'


end
