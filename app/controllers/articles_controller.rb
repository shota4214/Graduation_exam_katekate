class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit update destroy]
  
  def index
    @articles = Article.where(draft: :false).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if params[:back]
      render :new
    else
      if params[:draft]
        if @article.update(draft: true)
          redirect_to user_path(current_user), notice: "下書き保存しました"
        else
          render :new
        end
      else
        if @article.save
          redirect_to articles_path, notice: "記事を作成しました"
        else
        render :new
        end
      end
    end
  end

  def show
    if user_signed_in?
      @favorite = current_user.favorites.find_by(article_id: @article.id)
      @comments = @article.comments
      @comment = @article.comments.build
      impressionist(@article, nil, unique: [:ip_address])
    end
  end

  def edit
  end

  def update
    if params[:draft]
      @article.update(draft: true)
      if @article.update(article_params)
        redirect_to articles_path, notice: "記事を編集しました"
      else
        render :edit
      end
    else
      @article.update(draft: false)
      if @article.update(article_params)
        redirect_to articles_path, notice: "記事を編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "記事を削除しました"
  end

  def confirm
      @article = current_user.articles.build(article_params)
      render :new if @article.invalid?
  end

  def rank
    @article_like_ranks = Article.find(Like.group(:article_id).order('count(article_id) desc').pluck(:article_id))
    @article_favorite_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').pluck(:article_id))
    @user_article_ranks = User.where(id: Article.group(:user_id).order('count(user_id) desc').pluck(:user_id))
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image, :image_cache, :type, :draft)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
