# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'expenses#index'

  devise_for :users

  resources :expenses

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :auth_token, only: %i[create destroy]
      resources :expenses, except: %i[new edit]
    end
  end
end
