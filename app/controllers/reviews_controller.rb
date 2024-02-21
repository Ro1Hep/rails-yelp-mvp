class ReviewsController < ApplicationController
  def index
    @reviews = Reviews.all(params[:restaurant_id])
  end

  def new
    @restaurant = restaurant_finder
    @review = Review.new
  end

  def create
    @review = Review.new(permit)
    restaurant = restaurant_finder
    @review.restaurant = restaurant
    @review.save
    if @review.save
      redirect_to restaurant_path(restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant), status: :see_other
  end

  private

  def restaurant_finder
    Restaurant.find(params[:restaurant_id])
  end

  def permit
    params.require(:review).permit(:content, :rating)
  end
end
