class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # scott
    @referrer = User.find_by(uid: @user.referrer) #Daniel
  end

end