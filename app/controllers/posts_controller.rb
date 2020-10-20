class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @user = current_user
    @comment = Comment.new
    @archives = @post.divide_monthly
  end

  def index
    @posts = Post.all
    @user = current_user
    @recommendeds = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  # def favorites
    # post_ids = current_user.favorites.pluck(:post_id)
    # @posts = Post.where(id: post_ids)
  # end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "投稿を追加"
    else
      render 'posts/new'
    end
  end

  def edit
  	@post = Post.find(params[:id])
  	@user = current_user
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  	 redirect_to post_path(@post)
    else
      render 'posts/edit'
    end
  end

  def destroy
  	@post = Post.find(params[:id])
  	@post.destroy
  	redirect_to posts_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:body, :user_id, :prefecure, :category, post_images_post_images: [])
  end
end
