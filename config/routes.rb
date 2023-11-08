Rails.application.routes.draw do
  root "books#index"

  devise_for :users, only: [:sessions, :registrations]

  resources :books

  get "up" => "rails/health#show", as: :rails_health_check

end
