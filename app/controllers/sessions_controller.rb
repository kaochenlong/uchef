class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.login(user_params)
      # 發號碼牌
      # 轉去首頁
      redirect_to root_path
    else
      redirect_to sign_in_sessions_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
