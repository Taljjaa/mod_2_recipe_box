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
    end

    def edit
    end

    def update 
    end
end
