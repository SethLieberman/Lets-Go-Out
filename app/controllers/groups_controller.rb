class GroupsController < ApplicationController
	def new
	end

	def create
		@group = Group.create(group_params) 
		redirect_to user_groups_path(@current_user.id)
	end

	def edit
	end

	def show
		current_user
		@group = Group.find(params[:id])
		@user = User.find(current_user)
		# @groups = Group.all
	end

	def index
		@user = User.find(current_user.id)
		@groups = Group.all
	end

	private 

	def group_params
		group_params = params.require(:group).permit(:title)
		group_params[:user_id] = current_user.id
		group_params
	end

end
