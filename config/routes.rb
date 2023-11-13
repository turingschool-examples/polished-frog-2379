Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hospitals, only: [:show], controller: "hospitals" do
    resources :doctors, only: [:show], controller: 'doctors' do
      resources :patients, only: [:destroy], controller: "doctor_patients"
    end
  end

  resources :patients, only: [:index], controller: "patients"
end
