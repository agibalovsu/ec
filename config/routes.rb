# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'points#index'

  resources :points, only: %i[index] do
    resources :charging_stations, only: %i[index], shallow: true do
      resources :connectors, only: %i[index], shallow: true
    end
  end

  resources :charging_sessions, only: %i[index show create] do
    member do
      post :stop
    end
  end
end
