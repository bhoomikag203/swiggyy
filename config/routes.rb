Rails.application.routes.draw do
	root 'restaurants#index'
	devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
	resources :restaurants do
		resources :meals
	end
	resources :users
  	get 'static_pages/help'
end
