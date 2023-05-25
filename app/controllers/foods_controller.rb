class FoodsController < ApplicationController
    # before_action :get_foods

    def index
    end

    def new
    end

    # def create
    #     name = params[:name]
    #     measurement = params[:measurement]
    #     price = params[:price]
    #     quantity = params[:quantity]
    #     @food = Food.new(name:, measurement:, price:, quantity:, user: current_user)
    #     if @food.save
    #     flash[:success] = 'Food created successfully'
    #     redirect_to foods_path
    #     else
    #     flash[:alert] = "Food couldn't be created"
    #     render 'new'
    #     end 
    # end

    def delete
    end

    private

    # get_foods = -> { posts = Food.where(id: current_user.id) }
    
    # define_method :get_foods, get_foods
end
