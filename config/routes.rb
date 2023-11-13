Rails.application.routes.draw do
  resources :doctors, only: [:show] do
    resources :patients, controller: "doctors/patients", only: [:destroy]
  end
  resources :patients, only: [:index]
end
