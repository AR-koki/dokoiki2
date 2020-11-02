class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    following.save
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    following.destroy
    redirect_to request.referer
  end

  def follower
    @user = User.find(params[:user_id])
    @users = @user.followings.order(created_at: :desc)
  end

  def followed
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
