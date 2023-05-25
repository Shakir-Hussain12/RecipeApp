class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe added successfully.'
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :quantity)
  end
end
