class PostsController < ApplicationController
  def index
    # @posts = User.find(params[:user_id]).posts
    @posts = Post.where(author_id: post_params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find_by(author_id: post_params[:user_id], id: post_params[:id])
    @user = User.find(params[:user_id])
  end

  private

  def post_params
    params.permit(:user_id, :id)
  end
end
