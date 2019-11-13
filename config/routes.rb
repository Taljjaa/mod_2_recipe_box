Rails.application.routes.draw do
  root to: "recipes#index"
  resources :tags
  resources :recipe_tags
  resources :recipes
  resources :users_recipes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
