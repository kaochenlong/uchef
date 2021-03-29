class RestaurantsController < ApplicationController
  def index
  end

  def new
  end

  def list
    # 寫入資料庫
    # redirect -> 列表頁
    # render html: "title is #{params[:title]}"
    redirect_to '/restaurants'
  end
end