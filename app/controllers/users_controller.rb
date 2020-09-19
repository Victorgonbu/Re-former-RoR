class UsersController < ApplicationController
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end
    
    def show
      @user = User.find(params[:id])
    end
    
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path
      else
        render :new
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      @user.update(user_params)
  
      flash.notice = "User '#{@user.username}' Updated!"
  
      redirect_to new_user_path
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
  
      flash.notice = "User '#{@user.username}' Deleted!"
  
      redirect_to @user
    end

    private 
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
