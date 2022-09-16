class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    @user.create_notification_follow!(current_user)
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
  end
end
