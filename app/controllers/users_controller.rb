class UsersController < ApplicationController
    before_action :authorized, only: [:index, :main, :show, :edit]
    before_action :if_admin?, only: [:edit, :index, :show]
    before_action :set_user, only: [:edit, :show]
    
    def index
        if params[:query]
           @users = User.search(params[:query]) 
        else
            @users = User.all
        end
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to login_path
        else
            render :new
        end
    end

    def main

    end

    def edit
        
    end

    def update
        @user = User.find_by_id(params[:id])
        # @user.profile_photo.attach(params[:profile_photo])
        @user.update(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            flash[:notice] = "User information was not updated."
            redirect_to gigs_path
        end
    end

    def destroy
        user = User.find_by_id(params[:id]).destroy
        flash[:notice] = "User deleted."
        redirect_to users_path
    end
  

    private

    def user_params
        params.require(:user).permit(:username, :password, :email, :admin, :name, :instrument, :profile_photo)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end

end
