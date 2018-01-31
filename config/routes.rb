Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'gossips#new', as: 'home'
	resources :gossips

end
