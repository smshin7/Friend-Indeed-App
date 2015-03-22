class PagesController < ApplicationController
	def homepage
		if params[:ref_id]
			cookies[:referral] = params[:ref_id]
		end

		if current_user
			redirect_to user_path(current_user)
		else
			render :homepage
		end
	end

  def about
  end

end
