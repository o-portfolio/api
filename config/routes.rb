OPortfolioApi::Application.routes.draw do
  resources :assessments, except: [:new, :edit]
  resources :entries, except: [:new, :edit]
  resources :users, except: [:new, :edit]
  
  get "authenticate" => "users#authenticate"
  
  root to: "users#authenticate"
end
