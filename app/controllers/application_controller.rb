class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(session[:user_id])
  end

  def is_user_authenticated?
    !current_user.nil?
  end

  def authenticate_user!
    if !is_user_authenticated?
      redirect_to login_url 
    end
  end

  helper_method :current_user
  helper_method :is_user_authenticated?
  helper_method :authenticate_user!
end
