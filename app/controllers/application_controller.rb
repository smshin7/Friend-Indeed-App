class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_deed

  def set_deed
  	@deed = Deed.new
  end

  def authenticate
    render json: 'Authentication required.' unless ApiKey.exists?(token: params[:token])
  end
 
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
