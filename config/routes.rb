Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/doctors/:id", to: "doctors#show"

  delete "/doctors/:id/patients/:id", to: "doctor_patients#destroy"
end
