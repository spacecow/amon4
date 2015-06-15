Rails.application.routes.draw do
  root :to => "pages#show", :id => 1

  resources :pages, only:[:show,:new,:create]
end
