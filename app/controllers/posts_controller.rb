class PostsController < ApplicationController
	def new
		@posts = Post.all
  		@post = Post.new
	end

	 def create
  		@post = Post.new(post_params)
  		@post.user_id = current_user.id
  		if @post.save
    		flash[:notice] ='success!'
    		redirect_to posts_path(@post.id)
  		else
    		flash.now[:notice]='danger'
    		render :new
  end
  end

	def index
    @user = current_user
 		@posts = Post.all
 		if user_signed_in?
 			@like_hash = Like.where(user_id:current_user.id).pluck(:id,:post_id).to_h
 		end
 	end

 	def show
 		@post = Post.find(params[:id])
    @user = @post.user_id
 		@comment = @post.comments.build
 	end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:content, :user_id, {images: []}, :images_cache)
  end
end
