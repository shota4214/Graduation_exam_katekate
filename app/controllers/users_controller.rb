class UsersController < ApplicationController

  def follow_index
    @user = User.find(params[:id])
    @following_users = @user.followings
    @follower_users = @user.followers
  end

  def show
    @user = User.find(params[:id])
    @user_age = @user.age
    @articles = @user.articles.all.order("created_at DESC")
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
