class MealsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_restaurant

    before_action only: [:new, :create] do |m|
    	m.require_restaurant_owner(@restaurant.user_id)
    end

    def index
    	@meals = Meal.all
    end

    def show
    	@meal = Meal.find_by(id: params[:id])
    end

	def new
		@meal = Meal.new
	end


	def create
    	@meal = Meal.new(meal_params.merge(restaurant_id: params[:restaurant_id]))

        if @meal.save
        	redirect_to restaurant_path(@restaurant), notice: 'Meals was successfully created.'
     	else
        	render :new
     	end
  	end

  	 def edit
	    @meal = Meal.find_by(id: params[:id])
	    @restaurant = @meal.restaurant
	end

	def update
	    @meal = Meal.find_by(id: params[:id])
	    @restaurant = @meal.restaurant

	    if @meal.update(meal_params)
	     	redirect_to restaurant_path(@restaurant), :action =>'show', notice: 'Meal was successfully updated.'
	    end
	end

	def destroy
	    @meal = Meal.find_by(id: params[:id])
	    @restaurant = @meal.restaurant

	    if @meal.destroy
	     redirect_to restaurant_path(@restaurant), notice: 'Meal was successfully destroyed.'
	    end

	end

	def meal_params
	    params.require(:meal).permit(:name, :price, :image, :category)
	end

	def set_restaurant
	    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
	end
end
