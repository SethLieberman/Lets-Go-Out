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

  def mail(email, token="seth")

    client = SendGrid::Client.new do |c|
      c.api_key = ENV['SENDGRID_API_KEY']
    end

    mail = SendGrid::Mail.new do |m|
         #Specify to whom you are sending with the Email object
         m.to = @user.email
         m.from = current_user.email
         m.subject = 'Invite to Group'   
         m.text = "Your token is http://letsgoout.helloseth.com/accept_invite/#{token}, you were invited by #{current_user.username} to #{@group.title}"
        
       end

       res = client.send(mail) 
       puts @code = res.code
       puts res.body 

     end
   end
