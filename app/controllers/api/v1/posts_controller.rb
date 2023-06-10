class Api::V1::PostsController < Api::V1::BaseController
  skip_before_action :authenticate, only: :index

  def index
    @posts = Post.where(author: User.find(params[:user_id]))

    render json: @posts
  end
end
