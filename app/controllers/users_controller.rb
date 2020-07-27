class UsersController < ApplicationController
    before_action :if_admin?, only: [:edit, :index, :show]
    before_action :set_user, only: [:edit, :show]
    
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to main_path
        else
            flash[:notice] = "Please submit all fields with valid information."
            redirect_to signup_path
        end
    end

    def main

    end

    def edit
        
    end

    def update

    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :admin)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end

end
