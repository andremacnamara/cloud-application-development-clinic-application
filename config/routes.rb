Rails.application.routes.draw do
  
  root to: 'welcome#show'
  
  resources :patients do
		resources :reports
	end
end