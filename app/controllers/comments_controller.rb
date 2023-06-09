class CommentsController < ApplicationController
  before_action :set_user, only: :index
  before_action :set_likes, only: :index

  def comment_a_post
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = Post.find(params[:id])
    if @comment.save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:id]}", notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post

    @comment.destroy
    redirect_back(fallback_location: post)
  end
end
