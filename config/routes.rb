Rails.application.routes.draw do
  
    root to: 'welcome#show'
    resources :users, controller: 'users', only: Clearance.configuration.user_actions
    
    get 'profile', to: 'welcome#index'
    get 'reporting', to: 'patients#report'
    resources :patients do
	    resources :reports
	end
end