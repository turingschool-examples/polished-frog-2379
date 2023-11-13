Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
resources :doctors, only: [:show] do
  resources :patients, only: :destroy, controller: "doctor_patients"
  # Defines the root path route ("/")
  # root "articles#index"
  end
end
