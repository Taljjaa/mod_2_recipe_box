class UsersRecipesController < ApplicationController
    def add_to_recipe_list
        @user = User.find(params[:user_id])
        @recipe = Recipe.find(params[:recipe_id])
    end
end
