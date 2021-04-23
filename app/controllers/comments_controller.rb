class CommentsController < ApplicationController
  before_action :check_user!

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.new(comment_params)
    # @comment.user = current_user

    if @comment.save
      redirect_to restaurant_path(@restaurant)  # 餐廳的 show
    else
      render 'restaurants/show'
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
                            .merge({user: current_user})

    # permited_params = params.require(:comment).permit(:content)
    # permited_params[:user] = current_user

    # return permited_params
  end
end
