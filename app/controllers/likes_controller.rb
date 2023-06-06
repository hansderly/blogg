class LikesController < ApplicationController
  def like_a_post
    @like = Like.new(author: current_user, post: Post.find(params[:id]))
    if @like.save
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:id]}", notice: 'You Liked this post!'
    else
      render :new, status: :unprocessable_entity
    end
  end
end
