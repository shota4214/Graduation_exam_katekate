class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_article

  def create
    Like.create(user_id: current_user.id, article_id: params[:article_id])
    @article.create_notification_like!(current_user)
  end

  def destroy
    Like.find_by(user_id: current_user.id, article_id: params[:article_id]).destroy
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end
end
