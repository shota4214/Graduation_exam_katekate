class UsersController < ApplicationController
before_action :authenticate_user!, only: %i[index follow_index]

  def index
    @users = current_user.followings && current_user.followers if user_signed_in?
  end

  def follow_index
    @user = User.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers
    @users = current_user.followings && current_user.followers if user_signed_in?
  end

  def show
    @user = User.find(params[:id])
    @user_age = @user.age
    @articles = @user.articles.all.order("created_at DESC").page(params[:page]).per(5)
    user_articles = @user.articles
    @like_count_all = 0
    @favorite_count_all = 0
    @impression_count_all = 0
    user_articles.each do |article|
      @like_count_all += article.likes.count
      @favorite_count_all += article.favorites.count
      @impression_count_all += article.impressions_count
    end
  end
end
