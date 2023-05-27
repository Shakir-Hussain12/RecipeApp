class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes.order(:created_at)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = current_user.recipes.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      redirect_to recipes_path, notice: t('.success')
    else
      render :new, alert: t('.failure')
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: t('.success')
  rescue ActiveRecord::RecordNotFound
    redirect_to recipes_path, alert: t('.failure')
  end

  def update
    @recipe = current_user.recipes.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe), notice: t('.success')
  rescue ActiveRecord::RecordNotFound
    redirect_to recipe_path(@recipe), alert: t('.failure')
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
