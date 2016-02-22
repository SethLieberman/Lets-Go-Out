class CommentsController < ApplicationController
  def new
  end

  def create
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to user_group_path(@user.id, @group.id)
  end

  def edit
  end

  def show

  end

  def index
  end

  def destroy
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_group_path(@user, @group)
  end

  private

  def comment_params
   params.require(:comment).permit(:content)

 end
end
