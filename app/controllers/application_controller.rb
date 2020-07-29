class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :require_login
    helper_method :if_admin?
    helper_method :authorized
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    
    def require_login
        !!current_user
    end

    def if_admin?
        require_login && current_user.admin
    end

    def authorized
        redirect_to root_path if !require_login
        flash[:notice] = "You must be logged in to view requested page."
    end

    def not_found
        flash[:error] = "Sorry, that route was not found"
        redirect_to main_path
    end
end
