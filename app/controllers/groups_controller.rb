class GroupsController < ApplicationController
	def new
	end

	def create
		@group = Group.create(group_params) 
		@current_user.groups.push
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
		@user = current_user
		@posts = @group.posts.sort_by {|post| post.created_at }.reverse
		@comment = Comment.all
	end

	def index
		@user = User.find(current_user.id)
		@groups = Group.all
	end

	def destroy
		@user = User.find(params[:user_id])
		@group = Group.find(params[:id])
		@group.destroy
		redirect_to user_groups_path(@user.id, @group.id)
	end

	private 

	def group_params
		group_params = params.require(:group).permit(:title)
		group_params[:user_id] = current_user.id
		group_params
	end

end
