Rails.application.routes.draw do
  resources :likes, only: [:create]
  resources :comments
  resources :posts
  resources :users
  
  post "/sign-in", to: "users#sign_in"
  get "/validate", to: "users#validate"
  delete '/unlike_post', to: 'likes#destroy'
end
