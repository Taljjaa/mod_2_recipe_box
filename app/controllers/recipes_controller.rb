class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new 
        @recipe = Recipe.new
        @tags = Tag.all
    end

    def create
        tags_ids = strip_tags(params[:recipe][:tags])
        if params[:recipe][:new_tag]
            @tag = Tag.create(name: params[:recipe][:new_tag])
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
                RecipeTag.create(recipe_id: @recipe.id, tag_id: tag_id)
            end
            redirect_to recipe_path(@recipe)
        else
            render :new
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
        @recipe_tags = @recipe.tags
        @tags = Tag.all
    end

    def update 
        @recipe = Recipe.find(params[:id])
    end

    def destroy
    end

    private 
    def recipe_params(*args)
        params.require(:recipe).permit(*args)
    end

    def strip_tags(tags)
        tags.delete_if {|tag| tag  == "0"}
    end
end
