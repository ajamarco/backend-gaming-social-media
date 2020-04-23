Rails.application.routes.draw do
  resources :users
  
  post "/sign-in", to: "users#sign_in"
end
