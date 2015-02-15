class UsersController < ApplicationController
  before_action :authorize

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @referrer = User.find_by(token: @user.referrer)
  end

end
