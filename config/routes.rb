Rails.application.routes.draw do

  resources :user , only: [:new,:create,:show] do
    resources :event , only: [:new,:create]
  end
  resources :event , only: [:show,:index]
  get 'sign_in',to: 'session#new'
  post 'login', to: 'session#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
