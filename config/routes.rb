Rails.application.routes.draw do
	root 'restaurants#index'
	devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
	resources :restaurants
	resources :users
  	get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
