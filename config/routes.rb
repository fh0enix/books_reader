Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations]
  resources :books

  get "up" => "rails/health#show", as: :rails_health_check

  root "books#index"
end
