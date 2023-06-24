class Api::V1
  :LikesController < ApplicationController
  before_action :set_like, only: %i[show update destroy]

  # GET /users/:user_id/posts/:post_id/likes
  def index
    @likes = Like.where(post_id: post.id)
    render json: @likes
  end

  # GET /users/:user_id/posts/:post_id/likes
  def show
    render json: @likes
  end

  # POST /users/:user_id/posts/:post_id/likes/
  def create
    @like = Like.new(user_params)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id/posts/:post_id/likes
  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id/posts/:post_id/likes
  def destroy
    @like.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_like
    @like = Like.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def like_params
    params.require(:like)
  end
end
