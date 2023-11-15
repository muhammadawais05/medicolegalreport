Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "admin/dashboard#index"
  resources :patient_information, only: %i[edit update show]
  post 'patient_information/generate_pdf', to: 'patient_information#generate_pdf', as: 'generate_pdf'
end
