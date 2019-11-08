Rails.application.routes.draw do
  root to:'realtors#index'
  resources :realtors
end
