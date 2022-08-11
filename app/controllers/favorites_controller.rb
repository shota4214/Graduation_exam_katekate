class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy index]

  def create
    favorite = current_user.favorites.create(article_id: params[:article_id])
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんの記事をお気に入りしました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to articles_path, notice: "#{favorite.article.user.name}さんの記事をお気に入り解除しました"
  end

  def index
    @favorites = current_user.favorite_articles.order(created_at: :desc)
  end
end
