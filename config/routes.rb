Rails.application.routes.draw do
  get 'dashboard/index'

  devise_for :users, :controllers => { :registrations => "registrations" }

  resources :rewards

  resources :redemptions

  resources :offer_shares

  resources :advocates

  root  "home#index"

  resources :customers

  resources :offers

  end
