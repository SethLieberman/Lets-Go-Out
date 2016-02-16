class AdminsController < ApplicationController
  def new
  	@admin = Admin.new
  end

  def create
  	@admin = Admin.new(admin_params)
  	if @admin.save
  		redirect_to @admin
  	else
  		redirect_to new_admin_path
  	end
  end

  def edit
  end

  def show
  	@admin = Admin.find(params[:id])
  end

  def index
  end

  def destroy
  	@admin = Admin.find(params[:id])
  	@admin.destroy
  	redirect_to logout_user_path, method: :delete
  end


	private
	def admin_params
		params.require(:admin).permit(:email, :password, :password_confirmation, :lname, :fname, :username, :zipcode)
	end

end