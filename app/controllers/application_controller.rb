class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_user, :user_signed_in?

  private
    def not_found
      render file: "#{Rails.root}/public/404.html",
             status: 404
    end

    def current_user
      User.find_by(id: session[ENV['session_name']])
    end

    def user_signed_in?
      if session[ENV['session_name']]
        return true
      else
        return false
      end
    end

    def check_user!
      redirect_to root_path if not user_signed_in?
    end
end
