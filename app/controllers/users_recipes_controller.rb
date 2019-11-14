class UsersRecipesController < ApplicationController
    def add_to_recipe_list
        @user = User.find(session[:user_id])
        @recipe = Recipe.find(params[:recipe_id])
        UsersRecipe.find_or_create_by(user_id: @user.id, recipe_id: @recipe.id)
        @my_recipes = @user.recipes
        byebug
    end
end
