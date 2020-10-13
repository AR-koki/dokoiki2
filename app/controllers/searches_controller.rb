class SearchesController < ApplicationController
  def search
  end
  def searched
  	word = params[:word]
  	@word = word
  	@posts = Post.search(word)
  end
end
