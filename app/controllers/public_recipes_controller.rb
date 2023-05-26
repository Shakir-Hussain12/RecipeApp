class PublicRecipesController < ApplicationController
    def index
        recipes = []
        recipes.push(Recipe.new(name: 'Bolo de cenoura', preparation_time: '45',cooking_time: '60', description: 'Bolo de cenoura com cobertura de chocolate', public: 'True'))
        recipes.push(Recipe.new(name: 'Bolo de chocolate', preparation_time: '30',cooking_time: '45', description: 'Bolo de chocolate com cobertura de Vanilla', public: 'True'))
        recipes.push(Recipe.new(name: 'Bolo de laranja', preparation_time: '30',cooking_time: '45', description: 'Bolo de laranja com cobertura de Creamy', public: 'False'))
        @public_recipes = recipes.select { |r|
            r.public == true
        }
        puts 'Iamhere'
        puts @public_recipes
        render 'index', locals: { recipes: @public_recipes }
    end
end
