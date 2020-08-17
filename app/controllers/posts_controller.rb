class PostsController < ApplicationController
    def index
        @posts = User.all 
        render json: @posts
    end 

    def show 
        @post = Post.find(params[:id])
        render json: @post
    end 

    def new 
        @post = Post.new 
    end 

    def create 
        @post = Post.create(post_params)
        render json: @post
    end 

    def edit 
        @post = post.find(params[:id])
    end 

    def update 
        post = post.find(params[:id])
        post.update(post_params)
        render json: @post
    end     
    
    def destroy
        @post = post.destroy(params[:id])
    end 

    private 

    def post_params
        params.require(:post).permit(:title, :body, :likes, :user_id)
    end     
end
