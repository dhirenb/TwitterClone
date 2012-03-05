class PostsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      redirect_to root_path
    else
      render 'main/home'
    end
  end

  def destroy
  end

end
