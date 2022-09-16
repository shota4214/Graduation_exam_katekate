class CommentsController < ApplicationController
  before_action :set_article, only: %i[create edit update]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.article_id = @article.id
    @article_user = User.find(@comment.article.user.id)
    respond_to do |format|
      if @comment.save
        @article.create_notification_comment!(current_user, @comment.id)
        unless @comment.article.user.id == current_user.id
          ContactMailer.comment_mail(@article_user, current_user).deliver
        end
        format.js { render :index }
      else
        format.html { redirect_to article_path(@article), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @article.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントを削除しました'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
