class PublicRecipesController < ApplicationController
  def index
    recipes = Recipe.where(public: true).order(created_at: :desc)
    render 'index', locals: { recipes: }
  end
end
