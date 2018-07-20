Rails.application.routes.draw do
  resources :restaurants

  root 'restaurants#index'

  get 'static_pages/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
