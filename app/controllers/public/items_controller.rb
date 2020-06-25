class Public::ItemsController < ApplicationController
	def top
	end
	def index
		@items = Item.where(is_sold: true)
	end
	def show
		@item=Item.find(params[:id])
		# @cart_item=current_end_user.cart_items.find_by(item_id: params[:item_id])
	end

	private
	def public_item_params
		params.require(:item).permit(:genre_id, :name, :descrioption, :price, :is_sold, :image)
	end

	# def cart_params
	# 		params.require(:item).permit(cart_item_attributes:
 #      [
 #        :amount
 #      ]
 #      )
	# end
end
