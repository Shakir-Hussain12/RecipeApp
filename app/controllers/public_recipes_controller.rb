class PublicRecipesController < ApplicationController
  def index
    recipes = Recipe.includes(:user, :category).where(public: true).order(created_at: :desc)
    render 'index', locals: { recipes: recipes }
  end
end
