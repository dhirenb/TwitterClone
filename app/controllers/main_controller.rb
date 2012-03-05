class MainController < ApplicationController
  def home
    if is_user_authenticated?
      # TODO: Is there better way to do this?
      @post = Post.new
      #TODO: Should be an aggegate feed, not just my own posts
      @posts = current_user.posts.all
    end
  end

  def help
  end

  def about
  end

end
