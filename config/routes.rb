require 'api_constraints'

Rails.application.routes.draw do
  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :players, only: [:index, :show], defaults: { format: :json }
    end
  end
end