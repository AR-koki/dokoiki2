class FavoritesController < ApplicationController
  def create
  	post = Post.find(params[:post_id])
  	favorite = current_user.favorites.new(post_id: post.id)
  	favorite.save
  	redirect_to request.referer
  end

  def destroy
	post = Post.find(params[:post_id])
	favorite = current_user.favorites.find_by(post_id: post.id)
	favorite.delete
	redirect_to request.referer
  end

  def cart_item_params
    params.require(:favorite).permit(:post_id, :user_id)
  end
end
