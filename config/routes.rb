Rails.application.routes.draw do
  devise_for :admin_users,ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :stores
  resources :order_products
  resources :orders
  resources :products
  devise_for :users
devise_scope :user do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  get 'welcome/index'
  root 'welcome#index' 
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
