module Api
  class UsersController < ApplicationController
    # before_action :authenticate

    def index
      users = User.all
      render json: users.to_json(:include => :deeds), only: [:id, :name, :uid, :referrer]
    end

    def show
      user = User.find(params[:id])
      render json: user.to_json(:include => :deeds), only: [:id, :name, :uid, :referrer]    
    end
  end
end