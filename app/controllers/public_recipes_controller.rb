class PublicRecipesController < ApplicationController
    def index
        recipes = Recipe.where(public: true)
        render 'index', locals: { recipes: }
    end
end
