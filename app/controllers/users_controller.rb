class UsersController < ApplicationController

  def index
    # @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @referrer = User.find_by(token: @user.referrer)
  end

end