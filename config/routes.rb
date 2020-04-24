Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :users
  
  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"
end
