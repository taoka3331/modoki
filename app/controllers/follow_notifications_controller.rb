class FollowNotificationsController < ApplicationController

	def index
	 @follow_notifications = current_user.follow_notifications
	end

	def link_through
	@follow_notification = FollowNotification.find(params[:id])
	@follow_notification.update read: true
	user = User.find_by(id: @follow_notification.notified_by_id)
	redirect_to user_path(user)
	end
end
