Rails.application.routes.draw do
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # auth routes
  resource :users, only [:create] # handles the user signing up

  post "/login", to: "auth#login" # handles login for an existing user in the DB

  get "/auto_login", to "auth#auto_login" # handles the automatic login once a use is able to successfully sign up/login

  get "/user_is_authed", to: "auth#user_is_authed" # a route that can only be accessed if a user is authorized

end
