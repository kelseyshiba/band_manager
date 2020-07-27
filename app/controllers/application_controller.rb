class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :require_login
    
    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end
    
    def require_login
        !!current_user
    end
end
