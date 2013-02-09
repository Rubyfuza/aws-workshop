class FollowingsController < ApplicationController
  def create
    @user = User.find_or_create_by_name!(params[:user])
    @follower = User.find_or_create_by_name!(params[:follower])
    @follower.follow(@user)
    redirect_to user_chirps_path(:name => @user.name)
  end
end
