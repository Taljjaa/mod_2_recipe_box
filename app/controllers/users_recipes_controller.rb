class UsersRecipesController < ApplicationController
    def add_to_recipe_list
        @recipe = Recipe.find(params[:recipe_id])
        @user = User.find_by(id: session[:user_id])
        UsersRecipe.find_or_create_by(user_id: @user.id, recipe_id: @recipe.id)
        redirect_to my_recipes_path
    end

    def my_recipes
        if session[:user_id]
            if params[:search] != nil
                @user = User.find(session[:user_id])
                @my_recipes = @user.recipes.filter do |recipe| 
                    recipe.name.downcase.include?(params[:search].downcase) 
                end
                # @my_recipes += @user.recipes.each do |recipe|
                #     recipe.tags.filter do |tag|
                #         tag.name.downcase.include?(params[:search].downcase)
                #     end
                # end.uniq
            else
                @user = User.find(session[:user_id])
                @my_recipes = @user.recipes
            end
        else
            redirect_to login_path
        end
    end

    def destroy
        UsersRecipe.find(params[:id]).delete
        redirect_to my_recipes_path
    end
end
