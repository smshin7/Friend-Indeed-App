class SessionsController < ApplicationController
	
  # Method creates session for user and sets the users referrer to the cookie set in
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user["id"]
    if user.referrer == nil
      if cookies[:referral]
        user.update(referrer: cookies[:referral])
      end
    end
    redirect_to user_path(current_user) 
  end

  # Method to sign out users
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end