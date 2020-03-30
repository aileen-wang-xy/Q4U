Rails.application.routes.draw do
  
  # post '/makeadeal', to: 'posts#createDeal'
  resources :posts do
    resources :comments
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'static_pages/home'
  get 'static_pages/requests'
  get 'static_pages/offers'
  devise_for :users do
    resources :posts
    resources :deals
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"
  post 'deals/create', to: 'deals#create'
  get 'deals/:id', to: 'deals#show'
  get 'deals', to: 'deals#index'
  get 'posts/:id', to: 'post#show'

  
end
