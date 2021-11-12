Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'webhooks', to: 'webhook#hook'
  get 'new', to: 'dashboard#new'

  namespace :v1, defaults: {format: 'json'}  do
    resources :webhooks
  end

  root 'dashboard#index'
end
