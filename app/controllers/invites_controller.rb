class InvitesController < ApplicationController

	def create
		@invite = Invite.new(invite_params)
		@invite.sender_id = current_user.id
		if @invite.save

	    #if the user already exists
	    if @invite.recipient != nil 

	       #send a notification email
	       InviteMailer.existing_user_invite(@invite).deliver 

	       #Add the user to the organization
	       @invite.recipient.groups.push(@invite.group)
	   else
	   	InviteMailer.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
	   end
	else
	     # oh no, creating an new invitation failed
	 end
	end

	def invite
		@user = User.find(params[:user_id])
		if @user.email = @user.email
			mail(@email)
		else
			@current_user.email = user.email
		end
		redirect_to users_path
	end




end
