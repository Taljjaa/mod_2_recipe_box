Rails.application.routes.draw do
  root to: "recipes#index"
  get '/login', to: "sessions#new", as: 'login'
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  post '/add_to_recipe_list', to: "users_recipes#add_to_recipe_list"
  resources :tags
  resources :recipe_tags
  resources :recipes
  resources :users_recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
