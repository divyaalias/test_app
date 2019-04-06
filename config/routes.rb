Rails.application.routes.draw do
  resources :forms
  root to: 'forms#new' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
