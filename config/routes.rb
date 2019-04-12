Rails.application.routes.draw do
  devise_for :users
  resources :forms do
  	collection do
	    get :preview
      post :send_form
      get :dashboard
		end
		member do    
    	put :create_answer

  	end
  end

  root to: 'forms#new' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
