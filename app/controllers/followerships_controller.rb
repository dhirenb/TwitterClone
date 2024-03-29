class FollowershipsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @user = User.find(params[:followership][:followed_id])
    current_user.follow(@user)
    redirect_to @user
  end

  def destroy
    @user = Followership.find(params[:id]).followed
    current_user.unfollow(@user)
    redirect_to @user
  end

end
