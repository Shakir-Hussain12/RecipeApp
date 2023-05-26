class FoodRecipesController < ApplicationController
    def index
        @food_recipes = Recipe.where(is_public: true)
    end
end
