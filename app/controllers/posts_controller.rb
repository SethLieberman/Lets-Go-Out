class PostsController < ApplicationController
	def new

	end

	def edit
	end

	def create
		@user = User.find(params[:user_id])
		@group = Group.find(params[:group_id])
		@post = Post.create(post_params)
		@user.posts.push @post 
		@group.posts.push @post 
		redirect_to user_group_path(@user.id, @group.id)
	end

	def show
		current_user
		@post = Post.find(params[:id])
		@comment = Comment.all
	end

	def index
		current_user
		@posts = current_user.posts.sort_by {|post| post.created_at }.reverse
		
	end

	def destroy
		@user = User.find(params[:user_id])
		@group = Group.find(params[:group_id])
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_group_path(@user.id, @group.id)

	end


	private 

	def post_params
		post_params = params.require(:post).permit(:title, :content)
	end
end
