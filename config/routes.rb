Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  #devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  #end

  root 'application#index'
  resources :grades

  #get 'application/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
