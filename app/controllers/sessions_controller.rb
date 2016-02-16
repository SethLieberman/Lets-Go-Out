class SessionsController < ApplicationController
  def new
    @users = User.new
  end

  def create
  	if params[:admin]
  		@admin = Admin.where(email:params[:email]).first
  	if @admin && @admin.authenticate(params[:password])
  		session[:admin_id] = @admin.admin_id
  		redirect_to admin_path @admin
  	else
  		flash[:alert]="login has failed"
  		render :new
  	end
  else
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.user_id
  		redirect_to user_path @user 
  	else
  		flash[:alert]="Login has failed"
  		render :new
  	end
  end
end

def destroy
	sessions[:user_id] = nil
	sessions[:admin_id] = nil
	redirect_to root_path
end

end
