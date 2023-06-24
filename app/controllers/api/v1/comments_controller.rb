class Api::V1::CommentsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]

  # GET /users/:user_id/posts/:post_id/comments
  def index
    user = User.find(params[:user_id])
    post = user.posts.includes(:comments).find(params[:post_id])
    comments = post.comments
    render json: comments
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User or post not found' }, status: :not_found
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end

  # GET /users/:user_id/posts/:post_id/comments/id
  def show
    render json: @comment
  end

  # POST /users/:user_id/posts/:post_id/comments/new
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id/posts/:post_id/comments/id
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/posts/:post_id/comments/id
  def destroy
    @comment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
