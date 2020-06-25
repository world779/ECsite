class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	helper_method :current_cart


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number])
	end

	private
	# def current_cart
	#     if session[:end_user_id]
	#       @cart = current_end_user.find_by(item_id: params[:item_id])
	#     else
	#       @cart = EndUser.create
	#       session[:end_user_id] = @cart.id
 #    	end
 # 	end
end
