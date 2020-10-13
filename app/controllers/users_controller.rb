class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @posts = @user.posts
    @archives = @post.divide_monthly
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def archives
    @user = User.find(params[:id])
    @post = Post.find(params[:id])
    @yyyymm = params[:yyyymm]
    @posts = @user.posts.where("strftime('%Y%m', posts.created_at) = '"+@yyyymm+"'")
  end

  def favorites
    @user = User.find_by(id: params[:id])
    @post = Post.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
    @archives = @post.divide_monthly
  end

  def conquer
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :user_image)
  end
end
