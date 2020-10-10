class HomesController < ApplicationController
  def top
    @posts = Post.all
    @user = current_user
	@recommendeds = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def about
  end
end
