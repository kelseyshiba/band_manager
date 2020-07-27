class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to main_path
        else
            flash[:notice] = "Please sign up for an account"
            redirect_to signup_path
        end
    end

    def main

    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :admin)
    end
end
