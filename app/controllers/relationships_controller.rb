class RelationshipsController < ApplicationController
  after_action :create_follow_notifications, only: [:create]

  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).following
    current_user.unfollow!(@user)
    redirect_to @user
  end

  private
     def create_follow_notifications
       return if @user.id == current_user.id
      FollowNotification.create(user_id: @user.id,
        notified_by_id: current_user.id,
        notified_type: 'あなたをフォロー')
     end
end
