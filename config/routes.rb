Mushrooms::Application.routes.draw do
  resources :mushrooms
  
  get "mushrooms/new"

  get "pages/home"
  
  get "pages/about"
  
  get "pages/search"
  
  get "mushrooms/search"

  match '/about',   :to => 'pages#about'
  
  match '/addmushroom',  :to => 'mushrooms#new'
  
  match '/viewall', 	:to => 'mushrooms#index'
  
  match '/search',	:to => 'pages#search'
  
  match '/searchmushroom', :to => 'mushrooms#search'
  
  root :to => 'pages#home'
end
