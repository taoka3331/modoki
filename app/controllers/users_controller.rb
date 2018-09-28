class UsersController < ApplicationController
  
  def show
    @user_id = current_user
  	@user = User.find(params[:id])
  	@posts = @user.posts
    if user_signed_in?
      @like_hash = Like.where(user_id:current_user.id).pluck(:id,:post_id).to_h
    end
  end

  def edit
   @user = User.find(params[:id])
   if @user != current_user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(user_params)
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end




  private 
    def user_params
    	params.require(:user).permit(:name, :avatar, :intoroduce)
    end
end
