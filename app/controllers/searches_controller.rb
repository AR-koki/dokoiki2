class SearchesController < ApplicationController
  def search
  	# @categories = Post.categories.all
  end
  def searched
  	word = Post.categories.key(params[:id].to_i)
  	@posts = Post.where(category: params[:id].to_i)
  	@word = word
  	# @posts = Post.search(word)
  end
end
