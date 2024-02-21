class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = restaurant_finder
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(permit)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def restaurant_finder
    @restaurant = Restaurant.find(params[:id])
  end

  def permit
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end
end
