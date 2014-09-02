Rails.application.routes.draw do
  resources :rewards

  resources :redemptions

  resources :offer_shares

  resources :advocates

  root 'home#index'

  resources :customers

  resources :offers

  end
