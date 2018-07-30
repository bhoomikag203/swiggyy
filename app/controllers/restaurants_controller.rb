class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], per_page: 6)
    
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant  = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    authorize @restaurant
    if @restaurant.save
      redirect_to :action => 'index'
    else
      flash.now[:success] = "unable to save"
      render :action => 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @meals = Meal.where(restaurant_id: params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def update
    @restaurant  = Restaurant.find(params[:id])
    authorize @restaurant
    if @restaurant.update(restaurant_params)
      redirect_to :action => 'index' , :id => @restaurant
      flash.now[:success] = " Updated "
    else
      render :action => 'edit'
    end
  end

  def destroy
    Restaurant.find(params[:id]).find_by(params[:id])
    if @restaurant.destroy
      flash[:success] = "Restaurant removed"
      redirect_to :action => 'index'
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phno, :category, :rating)
  end

end
