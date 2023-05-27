class FoodsController < ApplicationController
  before_action :fetch_foods

  def index
    render 'index', locals: { foods: @foods }
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      flash[:success] = 'Food created successfully'
      redirect_to foods_path
    else
      flash[:alert] = "Food couldn't be created"
      redirect_to new_food_path
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.destroy
      redirect_to foods_path, notice: 'Food destroyed successfully'
    else
      redirect_to foods_path, notice: 'Food deletion failed'
    end
  end

  def general_shopping_list
    @shopping_list = current_user.foods.select('foods.name', 'SUM(public_recipes.quantity) AS total_quantity', 'foods.quantity AS food_quantity',
                                               'foods.price')
      .joins(public_recipes: :recipe)
      .group('foods.name, foods.quantity, foods.price')
      .having('SUM(public_recipes.quantity) > foods.quantity')

    @total_food_items = @shopping_list.length
    puts @total_food_items
    @total = @shopping_list.sum { |food| (food.total_quantity - food.food_quantity) * food.price }
  end

  private

  def fetch_foods
    @foods = current_user.foods
  end

  def food_params
    params.require(:food).permit(:name, :measurement, :quantity, :price)
  end
end
