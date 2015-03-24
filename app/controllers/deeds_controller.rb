class DeedsController < ApplicationController
  before_action :authorize

  def index
    @user = User.find(params[:user_id])
    @deeds = @user.deeds.all.order(created_at: :desc)
  end

  def new
    @deed = Deed.new
  end

  def create
    current_user = User.find(params[:user_id]) unless current_user
    current_user.deeds.new(params.require(:deed).permit!)
    current_user.save
    redirect_to user_deeds_path(current_user)

    # if current_user.save
    #   redirect_to user_deeds_path(current_user)
    # else
    #   render :new
    # end
  end

  def edit
    get_deed
  end

  def update
    get_deed
    
    if @deed.update(deed_params)
      redirect_to user_deeds_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    get_deed
    @deed.destroy
    redirect_to user_deeds_path(current_user)
  end

  private

  def deed_params
    params.require(:deed).permit!
  end

  def get_deed
    @deed = current_user.deeds.find(params[:id])
  end


end
