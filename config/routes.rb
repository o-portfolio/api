OPortfolioApi::Application.routes.draw do
  resources :entries


  resources :users
  
  get "authenticate" => "users#authenticate"
  
  root to: "users#authenticate"
end
