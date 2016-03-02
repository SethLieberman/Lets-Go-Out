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

		
		# @token = i.generate_token
		i = Invite.create(user_id: @user.id, group_id: @group.id)

		# the user should have an email...check to make sure
		if @user.email
			mail(@user.email, i.token)
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

	def accept_token

		# we need token
		# token must be present and matched
		# connect that use to group
		@token = params[:invite_token]
		@invite = Invite.where(token: @token).first
		puts "INVITE IS #{@invite.inspect}"
		# find the group
		@group = Group.find(@invite.group_id)
		# find the user
		@user = User.find(@invite.user_id)
		# add the invited user to the specific group
		@group.users.push(@user)

		redirect_to root_path
		flash[:alert] = "You have been added to the group"
		
	end


end
