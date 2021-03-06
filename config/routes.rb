Rails.application.routes.draw do

  resources :products
  ActiveAdmin.routes(self)
  devise_for :users

  #devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  #end
  get 'persons/profile'
  root 'application#index'
  resources :grades do
    resources :pupils do
      resources :scores, :truancies
    end
  end



  scope module: :subject do
    resources :scores
  end

  resources :line_items, only: [:create, :update, :destroy] do
    get 'destroy_all', on: :collection
  end

  resources :orders do
    get :close, on: :member

    scope module: :orders do
      resource :verifications, only: [:create, :update]
    end
  end

  resource :geolocations, only: :update

  resource :truancies

  get 'send_items/send_items'

  #get 'application/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
