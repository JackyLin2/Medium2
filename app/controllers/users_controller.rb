class UsersController < ApplicationController
    
    def index
        @users = User.all 
        render json: @users
    end 

    def show 
        @user = User.find(params[:id])
        render json: @user
    end 

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        render json: @user
    end 

    def edit 
        @user = user.find(params[:id])
    end 

    def update 
        user = user.find(params[id])
        user.update(user_params)
        render json: @user
    end     
    
    def destroy
        @user = user.destroy(params[:id])
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :username, :password, :email)
    end     
end
