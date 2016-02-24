class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
  	if session[:user_id]
  		@current_user = User.find(session[:user_id])
  end
end

  def current_admin
  	if session[:admin_id]
  		@current_admin = Admin.find(session[:admin_id])
  	end
  end
end
