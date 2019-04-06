Rails.application.routes.draw do
  resources :forms do
  	collection do
	    get :preview
		end
		member do    
    	put :create_answer
  	end
  end

  root to: 'forms#new' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
