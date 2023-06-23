class PostsController < ApplicationController
  def index
    @user = User.includes(:posts, posts: [:comments]).find(params[:user_id])
  end

  def show
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new, locals: { post: @post }
    end
  end

  private

  def post_params
    params.permit(:title, :text)
  end
end
