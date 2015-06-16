Rails.application.routes.draw do

  root :to => "pages#show"

  resources :pages, only:[:show,:new,:create,:edit,:update]

  resources :sessions, only: :create
  get 'login', to: 'sessions#new'

end
