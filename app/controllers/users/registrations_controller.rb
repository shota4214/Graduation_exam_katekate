# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :ensure_normal_user, only: %i[destroy] ゲストユーザーを削除できないようにする
  # before_action :ensure_admin_user, only: %i[destroy] ゲストadminユーザーを削除できないようにする
  # before_action :configure_sign_up_params, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    unless params[:user][:name].empty? || params[:user][:email].empty? || params[:user][:password].empty? || params[:user][:password_confirmation].empty?
    ContactMailer.send_when_sign_up(params[:user][:email], params[:user][:name]).deliver
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute, :name, :email, :prefectures, :birthday, :sex, :image, :image_cache, :introduction, :password, :password_confirmation, :current_password, :twitter_url, :instagram_url, :tiktok_url, :facebook_url, :youtube_url, :website_url])
  end

  # def ensure_normal_user ゲストユーザーを削除できないようにする
  #   if resource.email == 'guest@guest.com'
  #     redirect_to root_path, alert: 'ゲストユーザーは削除できません'
  #   end
  # end

  # def ensure_admin_user ゲストadminユーザーを削除できないようにする
  #   if resource.email == 'admin_guest@guest.com'
  #     redirect_to root_path, alert: 'ゲスト管理者は削除できません'
  #   end
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
