class UsersRecipesController < ApplicationController
    def add_to_recipe_list
        @recipe = Recipe.find(params[:recipe_id])
        @user = User.find(session[:user_id])
        UsersRecipe.find_or_create_by(user_id: @user.id, recipe_id: @recipe.id)
        redirect_to my_recipes_path
    end

    def my_recipes
        @user = User.find(session[:user_id])
        @my_recipes = @user.recipes
    end
end
