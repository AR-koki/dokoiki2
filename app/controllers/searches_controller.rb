class SearchesController < ApplicationController
  before_action :authenticate_user!
  def search
  end
  def map_searched
  	word = Post.prefecures.key(params[:id].to_i)
  	@posts = Post.where(prefecure: params[:id])
  	@word = word
  end
  def category_searched
  	word = Post.categories.key(params[:id].to_i)
  	@posts = Post.where(category: params[:id].to_i)
  	@word = word
  end
  def word_searched
  	word = params[:word]
  	@word = word
  	@posts = Post.search(word)
  end
end
