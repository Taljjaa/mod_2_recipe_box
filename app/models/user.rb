class User < ApplicationRecord
    has_many :users_recipes
    has_many :recipes, through: :users_recipes
end
