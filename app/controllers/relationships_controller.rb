class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @user = user.find(params[:relationship][:following_id])
    current_user.follow!(@user)
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
  end
end
