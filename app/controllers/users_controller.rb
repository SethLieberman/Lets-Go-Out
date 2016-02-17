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
  end

  def index
  	@users = User.all
    @posts = Post.all
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to logout_user_path, method: :delete
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :lname, :fname, :username, :zipcode)
  end
  
end

