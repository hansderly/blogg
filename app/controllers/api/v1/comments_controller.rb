class Api::V1::CommentsController < Api::V1::BaseController

  def index
    post = Post.find(params[:post_id])
    @comments = Comment.where(post:)

    render json: @comments
  end

  def create
    @new_comment = Comment.new(params.require(:comment).permit(:post_id, :text)))
    @new_comment.post_id = params[:post_id]
    @new_comment.author = @authorized_user

    if @new_comment.save
      render json: @new_comment, status: :created,
    else
      render json: @new_comment.errors, status: :unprocessable_entity
    end
  end

end
