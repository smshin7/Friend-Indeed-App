class DeedsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @deeds = @user.deeds
  end

  def new
    @deed = Deed.new
  end

  def create
    
    current_user = User.find(params[:user_id]) unless current_user
    current_user.deeds.new(params.require(:deed).permit!)

    if current_user.save
      redirect_to user_deeds_path(current_user)
    else
      render :new
    end
  end

  def edit
    get_deed
  end

  def update
    get_deed

    @deed.update(deed_params)

    if current_user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    get_deed
    
    if @deed.destroy
      redirect_to root_path
    end
  end

  private

  def deed_params
    pararms.require(:deed).permit!
  end

  def get_deed
    @deed = current_user.deed.find(params[:id])
  end


end
