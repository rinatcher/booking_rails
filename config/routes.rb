# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
  devise_for :users

  root 'pages#index'
  resources :reviews
  resources :rooms
  resources :bookings

  namespace :admin do
    resources :reviews
    resources :rooms
    resources :bookings
  end
end
