class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new 
        if session[:user_id]
            @recipe = Recipe.new
            @tags = Tag.all
        else
            redirect_to login_path
        end
    end

    def create
        tags_ids = strip_tags(params[:recipe][:tags])
        if params[:recipe][:new_tag].length > 0
            @tag = Tag.find_or_create_by(name: params[:recipe][:new_tag])
            tags_ids << @tag.id
        end
        @recipe = Recipe.new(
            name: params[:recipe][:name], 
            cook_time: params[:recipe][:cook_time], 
            image: params[:recipe][:image], 
            url: params[:recipe][:url]
        )
        if @recipe.valid?
            @recipe.save
            tags_ids.each do |tag_id|
                RecipeTag.find_or_create_by(recipe_id: @recipe.id, tag_id: tag_id)
            end
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def edit
        if session[:user_id]
            @recipe = Recipe.find(params[:id])
            @recipe_tags = @recipe.tags
            @tags = Tag.all
        else
            redirect_to login_path
        end
    end

    def update 
        @recipe = Recipe.find(params[:id])
        @recipe.update(
            name: params[:recipe][:name], 
            cook_time: params[:recipe][:cook_time], 
            image: params[:recipe][:image], 
            url: params[:recipe][:url]
        )
        tags_ids = strip_tags(params[:recipe][:tags])
        if params[:recipe][:new_tag].length > 0
            @tag = Tag.create(name: params[:recipe][:new_tag])
            tags_ids << @tag.id
        end
        tags_ids.each do |tag_id|
            @recipe.recipe_tags.find_or_create_by(tag_id: tag_id)
        end
        redirect_to recipe_path(@recipe)
    end

    private 
    def recipe_params
        params.require(:recipe).permit(:name, :cook_time, :image, :url, tags)
    end

    def strip_tags(tags)
        tags.delete_if {|tag| tag  == "0"}
    end
end
