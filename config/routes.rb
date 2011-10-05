Mushrooms::Application.routes.draw do
  get "pages/home"
  
  get "pages/about"

  match '/about',   :to => 'pages#about'
  
  root :to => 'pages#home'
end
