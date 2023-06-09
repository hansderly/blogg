class PostsController < ApplicationController
  load_and_authorize_resource


  def index
    @user = User.find(params[:user_id])
    @posts = @user.all_posts
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = @post.author

    @post.destroy
    redirect_to user_posts_path(user)
  end

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
