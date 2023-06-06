class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.all_posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end
end
