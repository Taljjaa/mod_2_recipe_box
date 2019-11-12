class Recipe < ApplicationRecord
    has_many :users_recipes
    has_many :users, through: :users_recipes
    has_many :recipe_tags 
    has_many :tags, through: :recipe_tags
end
