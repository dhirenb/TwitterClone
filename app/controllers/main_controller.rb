class MainController < ApplicationController
  def home
    if is_user_authenticated?
      # TODO: Is there better way to do this?
      @post = Post.new
    end
  end

  def help
  end

  def about
  end

end
