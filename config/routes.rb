Mushrooms::Application.routes.draw do
  resources :mushrooms
  
  get "mushrooms/new"

  get "pages/home"
  
  get "pages/about"

  match '/about',   :to => 'pages#about'
  
  match '/addmushroom',  :to => 'mushrooms#new'
  
  root :to => 'pages#home'
end
