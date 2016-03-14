class GroupsController < ApplicationController
	def new
	end

	def create
		@group = Group.create(group_params) 
		@current_user.shared_groups.push @group
		@group.owner = current_user
		@group.save
		redirect_to user_groups_path(@current_user.id)
	end

	def edit
		@group = Group.find(params[:id])
	end

	def update
		@group = Group.find(params[:id])
		@group.update_attributes(group_params)
		redirect_to edit_user_group_path(@current_user.id, @group.id)
	end

	def show
		
		@group = Group.find(params[:id])
		@user = User.find(params[:user_id])
		@posts = @group.posts.sort_by {|post| post.created_at }.reverse
		
	end

	def index
		@users = User.all
		@user = User.find(params[:user_id])
		@groups = @user.shared_groups
	end

	def destroy
		@user = User.find(params[:user_id])
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to user_groups_path(@user.id, @group.id)
	end

	def leave_group
		# @user = User.find(params[:user_id])
		puts '***************&&&&&&&&&&&&^^^^^^^^^^^^'
		redirect_to user_path(current_user.id)
	end

	private 

	def group_params
		group_params = params.require(:group).permit(:title)
		# group_params[:user_id] = current_user.id
		group_params
	end

end
