Rails.application.routes.draw do
  resources :posts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'static_pages/home'
  get 'static_pages/requests'
  get 'static_pages/offers'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "static_pages#home"

end
