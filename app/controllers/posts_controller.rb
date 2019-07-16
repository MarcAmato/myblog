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
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		# render plain: params[:post].inspect
		@post = Post.new(post_params)

		if@post.save
			redirect_to @post
		else
			# Re-render the form
			render 'new'
		end
	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private def post_params
		# Only able to take in a title and a body
		params.require(:post).permit(:title, :body)
	end
end
