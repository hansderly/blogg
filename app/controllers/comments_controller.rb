class CommentsController < ApplicationController
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
end
