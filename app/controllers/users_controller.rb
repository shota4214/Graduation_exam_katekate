class UsersController < ApplicationController

  def follow_index
    @user = User.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers
  end

  def show
    @user = User.find(params[:id])
    @user_age = @user.age
    @articles = @user.articles.all
  end
end
