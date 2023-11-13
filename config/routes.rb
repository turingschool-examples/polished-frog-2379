Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :doctors, only: [:show]
  resources :patient_doctors, only: [:destroy]
  resources :patients, only: :index
  resources :hospitals, only: :show
end
