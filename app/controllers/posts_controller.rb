class PostsController < ApplicationController
	def new

	end

	def edit
	end

	def create
		@post = Post.create(post_params) 
		redirect_to user_path(@current_user.id)
	end

	def show
		current_user
		@post = Post.find(params[:id])
	end

	def index
		@posts = Post.all
		@comments = Comment.all
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(@current_user)
	end


	private 

	def post_params
		post_params = params.require(:post).permit(:title, :content)
		post_params[:user_id] = current_user.id
		post_params
	end
end
