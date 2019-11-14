class Tag < ApplicationRecord
    has_many :recipe_tags, dependent: :delete_all
    has_many :recipes, through: :recipe_tags
end
