class FoodsController < ApplicationController
    # before_action :get_foods

    def index
        # testing
        foods = []
        foods.push(Food.new(name: 'Biryani', measurement: 'KGs',price: '2.00',quantity: 1, user_id: 1))
        foods.push(Food.new(name: 'Karahi', measurement: 'KGs', price: '1.50', quantity: 1, user_id: 1))
        foods.push(Food.new(name: 'Korma', measurement: 'KGs', price: '1.00', quantity: 1, user_id: 1))
        render 'index', locals: { foods: foods }
    end

    def new
    end

    def create
        @food = current_user.foods.build(food_params)
        if @food.save
        flash[:success] = 'Food created successfully'
        redirect_to foods_path
        else
        flash[:alert] = "Food couldn't be created"
        render 'new'
        end 
    end

    def delete
    end

    private

    # get_foods = -> { posts = Food.where(id: current_user.id) }
    # define_method :get_foods, get_foods

    def food_params
        params.require(:food).permit(:name, :measurement, :price)
    end
end
