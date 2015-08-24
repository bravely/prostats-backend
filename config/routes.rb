require 'api_constraints'

Rails.application.routes.draw do
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :leagues, only: [:index, :show], defaults: { format: :json }
      resources :tournaments, only: [:show], defaults: { format: :json }
      resources :matches, only: [:show], defaults: { format: :json }
      resources :games, only: [:show], defaults: { format: :json }
      resources :teams, only: [:index, :show], defaults: { format: :json }
      resources :players, only: [:index, :show], defaults: { format: :json }
    end
  end
end
