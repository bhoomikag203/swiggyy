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
      flash[:success] = "unable to save"
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
    @restaurant  = Restaurant.new(restaurant_params)
    if @restaurant.update_attributes(restaurant_params)
      redirect_to :action => 'show' , :id => @restaurant
      flash[:success] = " Updated "
    else
      render :action => 'edit'
    end
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    flash[:success] = "Restaurant deleted"
    redirect_to :action => 'index'
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :phno, :category)
  end

end
