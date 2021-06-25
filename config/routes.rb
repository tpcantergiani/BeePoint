# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :vehicles do
  #   resources :waypoints
  # end

  post 'api/v1/gps', to: 'api/v1/vehicles#gps'
  get 'show', to: 'vehicles#index'
end
