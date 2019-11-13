class User < ApplicationRecord
    has_secure_password
    has_many :users_recipes
    has_many :recipes, through: :users_recipes
    validates :username, uniqueness: true
end
