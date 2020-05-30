class Public::EndUsersController < ApplicationController
	before_action :authenticate_end_user!
	def show
	end

	def edit
	end

	def update
		if current_end_user.update(end_user_params)
			redirect_to end_user_path
		else
			render "edit"
		end
	end

	def confirm
	end

	def withdraw
		current_end_user.update(is_active: false)
		reset_session
		redirect_to root_path
	end

	private
	def end_user_params
		params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_active)
	end
	
end
