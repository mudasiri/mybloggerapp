class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(@post.author_id, @post)
    else
      flash.now[:error] = 'Error: Comment could not be saved'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
