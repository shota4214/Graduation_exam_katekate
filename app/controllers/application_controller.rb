class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = Article.where(draft: false).ransack(params[:q])
    @search_articles = @search.result.order("created_at DESC").page(params[:page]).per(20)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name prefectures birthday sex])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name prefectures birthday sex image image_cache introduction twitter_url instagram_url tiktok_url facebook_url youtube_url website_url])
  end
end
