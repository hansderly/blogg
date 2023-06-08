class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.last_three_posts
  end
end
