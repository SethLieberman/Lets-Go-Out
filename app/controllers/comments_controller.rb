class CommentsController < ApplicationController
  def new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to user_path(@current_user)
  end

  def edit
  end

  def show

  end

  def index
  end

  def destroy
  end

  private

  def comment_params
    comment_params = params.require(:comment).permit(:content)
    comment_params
  end
end
