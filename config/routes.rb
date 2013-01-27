OPortfolioApi::Application.routes.draw do
  resources :photos


  resources :entries


  resources :users
  
  get "authenticate" => "users#authenticate"
  
  root to: "users#authenticate"
end
