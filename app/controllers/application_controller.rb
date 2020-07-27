class ApplicationController < ActionController::Base
   def require_login
    !!session[:user_id]
   end
end
