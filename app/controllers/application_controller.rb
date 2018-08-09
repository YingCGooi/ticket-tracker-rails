class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :same_as_current_user?, :show_action?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def same_as_current_user?(user)
    current_user.id == user.id
  end

  def require_user
    unless logged_in?
      flash[:error] = "Must be logged in to do that!"
      redirect_back fallback_location: root_path
    end
  end

  def show_action?
    params[:action] == 'show'
  end
end
