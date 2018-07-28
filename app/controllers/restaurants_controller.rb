class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.paginate(page: params[:page], per_page: 6)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant  = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to :action => 'index'
    else
      flash.now[:success] = "unable to save"
      render :action => 'new'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant  = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to :action => 'index' , :id => @restaurant
      flash.now[:success] = " Updated "
    else
      render :action => 'edit'
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant removed"
    redirect_to :action => 'index'
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phno, :category, :rating)
  end

end
