Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'application#index'

  #get 'application/grades'

  resources :grades

  #get 'application/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
