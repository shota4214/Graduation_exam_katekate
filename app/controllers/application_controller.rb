class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protect_from_forgery

  def set_search
    @search = Article.where(draft: false).ransack(params[:q])
    @search_articles = @search.result.order("created_at DESC").page(params[:page]).per(20)
  end

  # unless Rails.env.production? #ローカル環境で使用の場合はこちらを使用
  unless Rails.env.development?
    rescue_from Exception, with: :_render_500
    rescue_from ActiveRecord::RecordNotFound,   with: :_render_404
    rescue_from ActionController::RoutingError, with: :_render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name prefectures birthday sex])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name prefectures birthday sex image image_cache introduction twitter_url instagram_url tiktok_url facebook_url youtube_url website_url])
  end

  private
    def _render_404(e = nil)
      logger.info "Rendering 404 with excaption: #{e.message}" if e

      if request.format.to_sym == :json
        render json: { error: "404 Not Found" }, status: :not_found
      else
        render "errors/404.html", status: :not_found, layout: "error"
      end
    end

    def _render_500(e = nil)
      logger.error "Rendering 500 with excaption: #{e.message}" if e

      if request.format.to_sym == :json
        render json: { error: "500 Internal Server Error" }, status: :internal_server_error
      else
        render "errors/500.html", status: :internal_server_error, layout: "error"
      end
    end
end
