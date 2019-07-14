class PostsController < ApplicationController
	# Create a method
	def index
		@posts = Post.all
	end 

	def show
		@post = Post.find(params[:id])
	end

	# This will take care of our new form
	def new

	end

	def create
		# render plain: params[:post].inspect
		@post = Post.new(post_params)

		@post.save
		redirect_to @post
	end

	private def post_params
		# Only able to take in a title and a body
		params.require(:post).permit(:title, :body)
	end
end
