Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/doctors/:id", to: "doctors#show"
  delete "/doctors/:id/patients/:patient_id", to: "patient_doctors#destroy"
  get "/patients", to: "patients#index"
  get "/hospitals/:id", to: "hospitals#show"
end
