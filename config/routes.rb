Rails.application.routes.draw do
  get 'companies/alphabetically', to: 'companies#alphabetically'

  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
