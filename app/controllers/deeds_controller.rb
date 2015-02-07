class DeedsController < ApplicationController

  def show
    @deed = current_user.deeds
  end

  def new
    @deed = Deed.new
  end

  def create
    current_user.deeds.new(params.require(:deed).permit!)

    if current_user.save
      redirect_to root_path
    else
      render :new
    end
  end

end