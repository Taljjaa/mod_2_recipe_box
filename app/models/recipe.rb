class Recipe < ApplicationRecord
    has_many :users_recipes, dependent: :destroy
    has_many :users, through: :users_recipes
    has_many :recipe_tags, dependent: :destroy 
    has_many :tags, through: :recipe_tags
    accepts_nested_attributes_for :tags
    validates :name, presence: true
end
