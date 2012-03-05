class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      # Automatically log in user
      # TODO: Is there a more elegant way to do this?
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Welcome to Twitter-land!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end
end
