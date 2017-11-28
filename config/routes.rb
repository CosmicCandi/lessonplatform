Rails.application.routes.draw do
  get 'companies/alphabetically', to: 'companies#alphabetically'
  get 'companies/with_modern_plan', to: 'companies#with_modern_plan'
  get 'companies/not_trialing', to: 'companies#not_trialing'

  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
