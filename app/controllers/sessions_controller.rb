class SessionsController < ApplicationController
  def home
    
  end

  def new
 
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to main_path
    else
      flash[:notice] = "Please submit a valid login or create an account"
      render :new
    end
  end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to main_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
