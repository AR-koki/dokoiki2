class CommentsController < ApplicationController
  def create
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
