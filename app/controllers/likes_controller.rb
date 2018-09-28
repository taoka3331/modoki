class LikesController < ApplicationController
	after_action :create_notifications, only: [:create]

	def create
 		@post = Post.find(params[:post_id])
	 	@like = Like.create(user_id: current_user.id, post_id: @post.id)
 		@like_hash ={}
 		@like_hash[@post.like_id] = @post.id

  		respond_to do |format|
  		format.html
  		format.js 
		end
 	end

	def destroy
 		@post = Post.find(params[:post_id])
 		like = Like.find_by(user_id: current_user.id, post_id:@post.id)
 		like.destroy
 		@like_hash ={}

  		respond_to do |format|
  		format.html
  		format.js
		end
 	end

  private
     def create_notifications
       return if @post.user.id == current_user.id
       Notification.create(user_id: @post.user.id,
        notified_by_id: current_user.id,
        post_id: @post.id,
        notified_type: 'あなたのつぶやきにいいね')
     end
end
