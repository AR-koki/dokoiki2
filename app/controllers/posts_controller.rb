class PostsController < ApplicationController

	def new
	end

	def show
	end

	def index
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def post_params
		params.require(:post).permit(:body, :post_image, :user_id)
	end

end
