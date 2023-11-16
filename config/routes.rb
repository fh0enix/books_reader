Rails.application.routes.draw do

  devise_for :users, only: [:sessions, :registrations]

  root "books#index"

  resources :books

  get "up" => "rails/health#show", as: :rails_health_check
end
