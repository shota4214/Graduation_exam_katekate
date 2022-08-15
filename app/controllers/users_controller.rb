class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[index follow_index update edit_step1 edit_step2 edit_step3 edit_step4]

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
    @user = User.find(user_id)
    # @user = User.find(params[:id])
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

  def edit_step1
    @user = User.find(user_id)
  end

  def edit_step2
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:birthday] = Date.new(params[:user]["birthday(1i)"].to_i, params[:user]["birthday(2i)"].to_i, params[:user]["birthday(3i)"].to_i)
    session[:sex] = user_params[:sex]
    session[:prefectures] = user_params[:prefectures]
    @user = User.find(user_id)
  end

  def edit_step3
    session[:image] = params[:user][:image]
    session[:image_cache] = params[:user][:image_cache]
    # session[:image] = user_params[:image].read
    # session[:image_cache] = user_params[:image_cache].read
    session[:introduction] = user_params[:introduction]
    @user = User.find(user_id)
  end

  def edit_step4
    session[:twitter_url] = user_params[:twitter_url]
    session[:instagram_url] = user_params[:instagram_url]
    session[:tiktok_url] = user_params[:tiktok_url]
    session[:facebook_url] = user_params[:facebook_url]
    session[:youtube_url] = user_params[:youtube_url]
    session[:website_url] = user_params[:website_url]
    @user = User.find(user_id)
  end

  # def edit_done
  #   session[:password] = user_params[:password]
  #   session[:password_confirmation] = user_params[:password_confirmation]
  #   # session[:current_password] = user_params[:current_password]
  #   @user = User.find(user_id)
  # end

  def update
    @user = User.find(user_id)
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:id] = params[:id]
    if @user.update!(image: session[:image], image_cache: session[:image_cache], name: session[:name], email: session[:email], birthday: session[:birthday], sex: session[:sex], prefectures: session[:prefectures], introduction: session[:introduction], password: session[:password], password_confirmation: session[:password_confirmation], twitter_url: session[:twitter_url], instagram_url: session[:instagram_url], tiktok_url: session[:tiktok_url], facebook_url: session[:facebook_url], youtube_url: session[:youtube_url], website_url: session[:website_url], id: session[:id])
      sign_in(@user, bypass: true) if current_user.id == @user.id
      redirect_to articles_path, notice: '編集しました'
    else
      redirect_to user_path, notice: '更新失敗しました'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :prefectures, :birthday, :sex, :image, :image_cache, :introduction, :password, :password_confirmation, :current_password, :twitter_url, :instagram_url, :tiktok_url, :facebook_url, :youtube_url, :website_url)
  end
end
