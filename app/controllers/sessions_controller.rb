class SessionsController < ApplicationController
  def home
    
  end

  def new
 
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      redirect_to main_path
    else
      flash[:notice] = "Please submit a valid login"
      redirect_to login_path
    end
  end

end
