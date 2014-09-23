Rails.application.routes.draw do

  # resources :payments

  resources :payment_plans do
    member do
      get 'select'
    end
  end

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :rewards

  resources :redemptions

  resources :offer_shares

  resources :advocates

  resources :payments
  get 'payments/test', to: 'payments#test'

  authenticated :user do
    root :to => 'dashboard#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')

  resources :customers

  resources :offers do
    member do
      get 'publish'
    end
  end

  end
