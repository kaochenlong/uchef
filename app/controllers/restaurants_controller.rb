class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:edit, :update, :destroy]
  before_action :check_user!, except: [:index, :show, :hello]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = @restaurant.comments.new
    @comments = @restaurant.comments.order(id: :desc)
  end

  def pocket_list
    @restaurant = Restaurant.find(params[:id])

    # if (current_user.pocket_list.exists?(@restaurant.id))

    if current_user.like?(@restaurant)
      # 移除名單
      current_user.pocket_list.destroy(@restaurant)
      render json: { id: @restaurant.id, status: 'removed'}
    else
      # 加名單
      current_user.pocket_list << @restaurant
      render json: { id: @restaurant.id, status: 'added'}
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    # @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.user_id = current_user.id
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, notice: '餐廳成功建立'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant), notice: '成功修改資料'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: '餐廳已刪除'
  end

  private
    def find_restaurant
      # @restaurant = Restaurant.find(params[:id])
      # 1
      # @restaurant = Restaurant.find_by!(
      #   id: params[:id],
      #   user_id: current_user.id
      # )

      # 2
      @restaurant = current_user.restaurants.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:title, :tel, :address, :email, :description)
    end
end
