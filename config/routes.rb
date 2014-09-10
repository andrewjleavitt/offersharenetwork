Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :rewards

  resources :redemptions

  resources :offer_shares

  resources :advocates

  resources :payments

  authenticated :user do
    root :to => 'dashboard#index', :as => :authenticated_root
  end
  root :to => redirect('/users/sign_in')

  resources :customers

  resources :offers

  end
