class Public::CartItemsController < ApplicationController
	before_action :set_cart_item!, only: [:index, :update, :destroy, :destroy_all]
	before_action :login_check!
	def index
		@cart_items=current_end_user.cart_items
	end

	def update
		# binding.pry
		@cart_item.update(amount: params[:cart_item][:amount].to_i)
		# binding.pry
		redirect_to cart_items_path
	end

	def destroy
		# binding.pry
		@cart_item.destroy
		redirect_to cart_items_path
	end

	def destroy_all
		# binding.pry
		current_end_user.cart_items.destroy_all
		redirect_to cart_items_path
	end


	def create
		# binding.pry
		@cart_item=current_end_user.cart_items.find_by(item_id: params[:item][:cart_items][:item_id])
		
		if @cart_item.blank?
			@cart_item = current_end_user.cart_items.build(item_id: params[:item][:cart_items][:item_id])
		end
		
		@cart_item.amount += params[:item][:cart_items][:amount].to_i
		# @cart_item.item_id = params[:item_id].to_i
		@cart_item.save
		
		redirect_to cart_items_path
	end

	private
	def set_cart_item!
		@cart_item=current_end_user.cart_items.find_by(id: params[:id])
	end

	def login_check!
		unless end_user_signed_in?
			flash[:error] = "ログインしてください"
			redirect_to new_end_user_session_path
		end
	end

	# def cart_item_params
	# 	params.require(:item).permit(cart_item_attributes:
 #      [
 #        :amount
 #      ]
 #      )
	# end
end
