class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy index]

  def create
    @article = Article.find(params[:article_id])
    Favorite.create(user_id: current_user.id, article_id: params[:article_id])
  end

  def destroy
    @article = Article.find(params[:id])
    Favorite.find_by(user_id: current_user.id, article_id: params[:id]).destroy
  end

  def index
    @favorites = current_user.favorite_articles.order(created_at: :desc).page(params[:page]).per(10)
  end
end
