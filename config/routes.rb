Rails.application.routes.draw do
  
    
    resources :users, controller: 'users', only: Clearance.configuration.user_actions
    root to: 'welcome#show'
    get 'profile', to: 'welcome#index'
    resources :patients do
	    resources :reports
	end
end