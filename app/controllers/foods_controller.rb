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
    puts 'deleting'
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, flash: { success: t('Deleted Successfully') }
  rescue ActiveRecord::RecordNotFound
    redirect_to foods_path, flash: { alert: t('Deletion Failed') }
  end

  private

  def fetch_foods
    @foods = Food.includes(:user).where(user_id: current_user.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement, :quantity, :price)
  end
end
