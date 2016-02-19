class UsersController < ApplicationController
  def new
  	@users = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to user_path @user 
  	else
      redirect_to login_path
  		# redirect_to new_user_path
  	end
  end

  def edit
  end

  def show
  	@user = User.find(params[:id])
    @users = User.all
    @posts = Post.all
    @comments = Comment.all    
    @comments = @comments.sort_by {|comment| comment.created_at}.reverse
    @posts = @posts.sort_by {|post| post.created_at }.reverse
  end

  def index
    @user = User.find(current_user)
    @users = User.all
    @posts = Post.all
    @comments = Comment.all
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to logout_user_path, method: :delete
  end

# to follow users
  def update_follow_status
    @user_to_follow = User.find(params[:id])
    if current_user.user_friends.include? @user_to_follow
      current_user.user_friends.destroy @user_to_follow

    else
      current_user.user_friends.push @user_to_follow

    end
    redirect_to users_path current_user
  end

# to add followers to groups

  def update_group_status
    @user_to_group = User.find(params[:id])
    current_user.groups.include? @user_to_group
      # current_user.groups.destroy @user_to_group

    # else
    #   current_user.user_groups.push @user_to_group

    # end
    redirect_to users_path current_user
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :lname, :fname, :username, :zipcode)
  end
  
end

