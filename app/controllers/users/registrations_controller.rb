# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    # super
    @user = User.find(user_id)
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:current_password] = user_params[:current_password]
    @user.update(image: session[:image], image_cache: session[:image_cache], name: session[:name], email: session[:email], birthday: session[:birthday], sex: session[:sex], prefectures: session[:prefectures], introduction: session[:introduction], password: session[:password], password_confirmation: session[:password_confirmation], current_password: session[:current_password], twitter_url: session[:twitter_url], instagram_url: session[:instagram_url], tiktok_url: session[:tiktok_url], facebook_url: session[:facebook_url], youtube_url: session[:youtube_url], website_url: session[:website_url])
    redirect_to articles_path
    # current_password: session[:current_password],
  end

  def edit_step1
    @user = User.find(user_id)
  end

  def edit_step2
    session[:image] = user_params[:image]
    session[:image_cache] = user_params[:image_cache]
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:birthday] = user_params[:birthday]
    session[:sex] = user_params[:sex]
    session[:prefectures] = user_params[:prefectures]
    @user = User.find(user_id)
  end

  def edit_step3
    session[:image] = user_params[:image]
    session[:image_cache] = user_params[:image_cache]
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

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :name, :email, :prefectures, :birthday, :sex, :image, :image_cache, :introduction, :password, :password_confirmation, :current_password, :twitter_url, :instagram_url, :tiktok_url, :facebook_url, :youtube_url, :website_url])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
