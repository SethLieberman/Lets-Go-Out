class InvitesController < ApplicationController

	def create
		@invite = Invite.new(invite_params)
		@invite.sender_id = current_user.id
		if @invite.save

	    #if the user already exists
	    if @invite.recipient != nil 

	       #send a notification email
	       SendGrid.existing_user_invite(@invite).deliver 

	       #Add the user to the organization
	       @invite.recipient.groups.push(@invite.group)
	   else
	   	SendGrid.new_user_invite(@invite, new_user_registration_path(:invite_token => @invite.token)).deliver
	   end
	else
	     # oh no, creating an new invitation failed
	 end
	end

	def invite
		puts params
		@user = User.find(params[:user_id])
		@group = Group.find(params[:id])
		i = Invite.create
		@token = i.generate_token

		# the user should have an email...check to make sure
		if @user.email
			mail(@user.email, @token)
			flash[:alert] = "Email sent to #{@user.username}"
		else
			# if the user does not have an email email the current_user
			# @user.email = current_user.email
			mail(@current_user.email)
			flash[:alert] = "Email sent to you"

		end
		redirect_to user_groups_path(current_user)
	end

	def select_group
		@user = User.find(params[:id])
		@groups = current_user.groups
	end



end
