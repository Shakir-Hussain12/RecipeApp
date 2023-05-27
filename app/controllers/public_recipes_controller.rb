class PublicRecipesController < ApplicationController
  def index
    recipes = Recipe.where(public: true).includes(:user, public_recipes: :food).order(created_at: :desc)
    render 'index', locals: { recipes: }
  end

  def new
    @recipe = current_user.recipes.find(params[:recipe_id])
    @public_recipe = PublicRecipe.new
  end

  def create
    @recipe = current_user.recipes.find(params[:recipe_id])
    @public_recipe = PublicRecipe.new(public_recipe_params.merge(recipe_id: @recipe.id))

    if @public_recipe.save
      redirect_to recipe_path(@recipe), notice: t('.success')
    else
      render :new, alert: t('.failure')
    end
  end

  def destroy
    @recipe = current_user.recipes.find(params[:recipe_id])
    @public_recipe = PublicRecipe.find(params[:id])
    @public_recipe.destroy
    redirect_to recipe_path(@recipe), notice: t('.success')
  end

  private

  def public_recipe_params
    params.require(:public_recipe).permit(:food_id, :quantity)
  end
end
