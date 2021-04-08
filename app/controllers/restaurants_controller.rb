class RestaurantsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new  # 借 new.html.erb
    end
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
    end
end