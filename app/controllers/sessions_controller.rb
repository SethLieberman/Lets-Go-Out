class SessionsController < ApplicationController
  # layout nil
  # layout 'application', :except => :view


  def new
    @user_signing_in = User.new
  end

  def create
  	if params[:admin]
  		@admin = Admin.where(email:params[:email]).first
  	if @admin && @admin.authenticate(params[:password])
  		session[:admin_id] = @admin.id
  		redirect_to admin_path @admin
  	else
  		flash[:alert]="Login has failed"
      puts "******************************"
  		redirect_to login_path
  	end
  else
  	@user = User.where(email: params[:email]).first
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to user_path @user 
  	else
  		flash[:alert]="Login has failed"
      redirect_to login_path
  	end
  end
end

def destroy
	session[:user_id] = nil
	session[:admin_id] = nil
	redirect_to root_path
end

end
