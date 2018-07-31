class OrdersController < ApplicationController
	before_action :authenticate_user!

	def restaurant_orders
	    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
	    @orders = @restaurant.orders
	end

	def index
		@orders = current_user.orders.all
	end

	def new
		@restaurants = current_order
		@order = Order.new
	end

	def create
		@restaurants = current_order
		@order = current_user.orders.new.build({:status => :Processing, :restaurant_id => restaurant_id)
		if @order.save
	end

	def order_params
      params.require(:order).permit(:status)
    end
end
