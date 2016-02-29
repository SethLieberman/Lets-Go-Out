class UsersController < ApplicationController

  def new
  	@users = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:alert]="Now you can sign in"
      redirect_to login_path 
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
    @groups = @user.groups
    @comments = Comment.all    
    @comments = @comments.sort_by {|comment| comment.created_at}.reverse
    @posts = @posts.sort_by {|post| post.created_at }.reverse
  end

  def index
    @user = current_user
    @users = User.all

  end

  def update
    current_user
    @current_user.update_attributes(update_params) 
    redirect_to user_path(params[:id])

  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to logout_user_path, method: :delete
  end

# to follow users
def update_follow_status
  @user_to_follow = User.find(params[:user_id])
  if current_user.user_friends.include? @user_to_follow
    current_user.user_friends.destroy @user_to_follow

  else
    current_user.user_friends.push @user_to_follow

  end
  redirect_to users_path
end

def add_place_group

    @place = Place.find(params[:place_id])
    @group = Group.find(params[:group_id])
    puts "PLACE IS #{@place}"
    puts "GROUP IS #{@group}"
    @group.places.push(@place)
    puts "******************$$$$$$$$"
    redirect_to user_group_path(current_user, @group.id)
end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :lname, :fname, :username, :zipcode, :avatar)
  end

  def update_params
    params.require(:user).permit(:username, :email, :zipcode, :lname, :fname, :zipcode, :avatar)
  end
  
end

